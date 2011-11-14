package HH::PC::Controller::Auth;
use Ze::Class;
extends 'HH::WAF::Controller';
with 'HH::Controller::Role::Session';

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
        $session->{member} = $member;
        $session->finalize();
    };

    if($@){
        # TODO
        use Data::Dumper;
        warn Dumper $@;
        die 'AUTH_ERROR';
    }



}

EOC;
