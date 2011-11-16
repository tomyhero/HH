package HH::PC::Controller::API::Message;
use Ze::Class;
extends 'HH::WAF::Controller';
with 'Ze::WAF::Controller::Role::JSON';


sub add {
    my ($self,$c) = @_;
    $c->abort_CSRF();
    if($c->req->method eq 'POST'){

        my $authorizer = HH::Authorizer::Member->new( c => $c ); 
        my $member = $authorizer->authorize() or return $c->set_json_error();

        my %data = (%{$c->req->as_fdat} , twitter_user_id => $member->{twitter_user_id} );

        $c->model('Message')->add(\%data);

        return $c->set_json_stash({});

    }
    else {
        return $c->set_json_error();
    }


}

sub list {
    my ($self,$c) = @_;
    my $items = $c->model('Message')->list($c->req->as_fdat);
    $c->set_json_stash( { items => $items } );
}



EOC;
