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
    my $res = $c->model('Head')->analyze( $c->req->as_fdat );
    $c->model('Head')->save( $res );
    my $path = sprintf('/%s',uri_escape($c->req->as_fdat->{url}));
    $c->redirect($path);
}

sub detail {
    my ($self,$c) = @_;
    $c->template( 'detail');
    my $url = $c->args->{url};

    my $page = $c->model('Page')->lookup($url);
    $c->stash->{page} = $page;
        
    $c->stash->{pages} = $c->model('Page')->recent();

}

EOC;
