package HH::Controller::Role::Session;
use Ze::Role;
use HH::Session;

sub create_session {
    my $self = shift;
    my $c    = shift;
    return HH::Session->create( $c->req ,$c->res );
}


1;
