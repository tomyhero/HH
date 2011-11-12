package HH::PC::Controller::Root;
use Ze::Class;
extends 'HH::WAF::Controller';

sub index {
    my ($self,$c) = @_;
    $c->res->body('HELLO');
}

EOC;
