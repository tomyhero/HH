package HH::PC::Controller::Root;
use Ze::Class;
extends 'HH::WAF::Controller';

sub index {
    my ($self,$c) = @_;
}

sub analyze {
    my ($self,$c) = @_;
    $c->redirect('/'); # XXX model errorの際の対応

    $c->model('Head')->analyze( $c->req->as_fdat );




}

EOC;
