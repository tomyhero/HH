package HH::Model::Message;
use Ze::Class;
use HH::DB;
extends 'HH::Model::Base';


sub profiles {
    {
        add => {
            required => [qw/page_id twitter_user_id message_body/],
        },
        list => {
            required => [qw/page_id/],
        }
    }
}

sub add {
    my $self = shift;
    my $args = shift;
    my $v = $self->assert_with( $args );
    
    my $dbh = HH::DB->get_dbh();

    $dbh->query("INSERT INTO message(page_id,twitter_user_id,message_body,created_at) VALUES(?,?,?,datetime('now', 'localtime'))",
        $v->{page_id},
        $v->{twitter_user_id},
        $v->{message_body}
    );

}

sub list {
    my $self = shift;
    my $args = shift;
    my $v = $self->assert_with( $args );
    my $dbh = HH::DB->get_dbh();
    my $messages = $dbh->select_all('SELECT * FROM message INNER JOIN member ON message.twitter_user_id = member.twitter_user_id WHERE message.page_id = ? ORDER BY message.message_id DESC LIMIT 20',$v->{page_id});

    for(@$messages){

        my $member = {
            twitter_user_id => delete $_->{twitter_user_id},
            icon_url => delete $_->{icon_url},
            name => delete $_->{name},
            screen_name => delete $_->{screen_name},
        };
        $_->{member} = $member;
    }

    return $messages;

}


EOC;
