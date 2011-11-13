package HH::PC::Controller::Root;
use Ze::Class;
extends 'HH::WAF::Controller';

sub index {
    my ($self,$c) = @_;
    if($c->req->method eq 'POST') {
        $self->do_index($c);
    } 
}

sub do_index {
    my ($self,$c) = @_;
    $c->model('Head')->analyze( $c->req->as_fdat );
}


EOC;
