package HH::PC::Context;
use Ze::Class;
extends 'HH::WAF::Context';
use HH::Session;

sub create_session {
    my $c = shift;
    HH::Session->create( $c->req, $c->res );
}


EOC;
