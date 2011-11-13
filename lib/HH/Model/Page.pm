package HH::Model::Page;
use Ze::Class;
use JSON::XS;
use HH::DB;
use Encode;
extends 'HH::Model::Base';


sub profiles {
    {
        lookup =>  {
            required => [qw/url/],
        }
    }
}


sub recent {
    my $self = shift;
    my $dbh = HH::DB->get_dbh;
    my $pages = $dbh->select_all('SELECT * FROM page ORDER BY page_id DESC limit 20');
    return $pages;

}
sub lookup {
    my $self = shift;
    my $url = shift ;
    my $v = $self->assert_with( { url => $url });
    my $dbh = HH::DB->get_dbh;

    # TODO
    my $page = $dbh->select_row('SELECT * FROM page WHERE url = ? ', $v->{url}  ) or return;

    if($page){


        # TODO
        my $head = $dbh->select_row('SELECT * FROM head WHERE page_id = ? and version = ?  ', $page->{page_id} , $page->{version} ) or return;
        $head->{attributes} = decode_json( Encode::encode('utf8',$head->{attributes_dump}));
        $page->{head} = $head;
    }

    return $page;
}

EOC;
