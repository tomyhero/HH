package HH::PC::Controller::Root;
use Ze::Class;
use URI::Escape;
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
    my $path = sprintf('/%s',uri_escape($c->req->as_fdat->{url}));
    $c->redirect($path);
}

sub detail {
    my ($self,$c) = @_;
    $c->template( 'detail');
    my $url = $c->args->{url};

}

EOC;
