package HH::WAF::Controller;
use Ze::Class;
use Try::Tiny;
extends 'Ze::WAF::Controller';


sub EXCECUTE {
    my( $self, $c, $action ) = @_;

    try {
        $self->$action( $c );
    }
    catch {
        if( ref $_ && ref $_ eq 'HH::Validator::Error') {
            $c->stash->{error_obj} = $_;
        }
        else {
            die $_; 
        }
    };

    return 1;
}


EOC;
