package HH::PC::Controller::Root;
use Ze::Class;
extends 'HH::WAF::Controller';

sub index {
    my ($self,$c) = @_;
}

sub analyze {
    my ($self,$c) = @_;
    $c->stash->{VIEW_TEMPLATE} = 'index';

    $c->model('Head')->analyze( $c->req->as_fdat );



}

EOC;
