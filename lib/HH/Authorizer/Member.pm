package HH::Authorizer::Member;
use Ze::Class;
extends 'HH::Authorizer::Base';
use HH::Session;
use HH::DB;

sub logout {
    my $self = shift;
    my $session = HH::Session->create($self->c->req,$self->c->res);
    $session->remove('twitter_user_id');
    $session->finalize();
}
sub authorize {
    my $self = shift;
    my $session = HH::Session->create($self->c->req,$self->c->res);

    if( my $twitter_user_id = $session->get('twitter_user_id') ){
        my $dbh = HH::DB->get_dbh;

        my $member 
            = $dbh->select_row( 'SELECT * FROM member WHERE twitter_user_id = ?',$twitter_user_id ) or return;

        return $member;

    }
    return;
}

EOC;

