package HH::Model::Head;
use Ze::Class;
use HH::DB;
use HH::Analyzer;
extends 'HH::Model::Base';


sub profiles {
    {
        analyze =>  {
            required => [qw/url/],
        }
    }
}

sub save {
    my $self = shift;
    my $res = shift;
    my $json = $res->to_json;

    my $dbh = HH::DB->get_dbh();

    my $page = $dbh->select_row('SELECT * FROM page WHERE url = ? ', $res->url  );

    if($page){

        my $head = $dbh->select_row('SELECT * FROM head WHERE page_id = ? and version = ?  ', $page->{page_id} , $page->{version} );
        if($head->{attributes_dump} eq $json ){
        }
        else {
            my $version = $page->{version} + 1;
            $dbh->query('UPDATE page SET version = ? WHERE page_id = ? ', $version ,$page->{page_id} );
            my $head = $dbh->query("INSERT INTO head (page_id,version,head_html,attributes_dump,created_at) VALUES (?,?,?,?,datetime('now', 'localtime'))", $page->{page_id},$version,$res->head_html,$json  );

        }

    }
    else {
        my $version = 1;
        # save page 
        $page = $dbh->query('INSERT INTO page (url,version) VALUES (?,?)', $res->url ,$version );

        # save head 
        my $head = $dbh->query("INSERT INTO head (page_id,version,head_html,attributes_dump,created_at) VALUES (?,?,?,?,datetime('now', 'localtime'))", $dbh->last_insert_id ,$version,$res->head_html,$json  );

    }

    1;
}

sub analyze {
    my $self = shift;
    my $args = shift || {};
    my $v = $self->assert_with($args);
    my $analyzer = HH::Analyzer->new();

    my $res = $analyzer->analyze( $v->{url} );

    return $res;
}

EOC;
