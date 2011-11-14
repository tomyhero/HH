package HH::PC::Controller::Auth;
use Ze::Class;
extends 'HH::WAF::Controller';
with 'HH::Controller::Role::Session';
use HH::Authorizer::Member;

sub connect {
    my ($self,$c) = @_;
    my $session = $self->create_session($c);    
    $c->redirect( $c->model( 'TwitterAuth' , { session => $session } )->oauth() );
    $session->finalize();
}

sub callback {
    my ($self,$c) = @_;
    my $session = $self->create_session($c);    

    eval {
        my $member = $c->model(  'TwitterAuth', { session => $session }  )->callback( $c->req->as_fdat );
        $session->set('twitter_user_id', $member->{twitter_user_id});
        $session->finalize();
    };

    if($@){
        # TODO
        use Data::Dumper;
        warn Dumper $@;
        die 'AUTH_ERROR';
    }
}

sub logout {
    my ($self,$c) = @_;
    my $authorizer = HH::Authorizer::Member->new(c => $c);
    $authorizer->logout();
    $c->redirect('/');
}

EOC;
