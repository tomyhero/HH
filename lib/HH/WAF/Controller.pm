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
        if( ref $_ && ref $_ eq 'Aplon::Error') {
            use Data::Dumper;
            warn Dumper $_;
        }
        else {
            die $_; 
        }
    };

    return 1;
}


EOC;
