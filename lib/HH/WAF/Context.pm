package HH::WAF::Context;
use Ze::Class;
extends 'Ze::WAF::Context';

__PACKAGE__->load_plugins( 'Ze::WAF::Plugin::Encode' );


my $MODELS ;
BEGIN {
    # PRE LOAD API
    $MODELS = {}; 
    my $finder = Module::Pluggable::Object->new(
        search_path => ['HH::Model'],
        except => qr/^(HH::Model::Base$|HH::Model::Role::)/, 
        'require' => 1,
    );
    my @classes = $finder->plugins;

    for my $class (@classes) {
        (my $moniker = $class) =~ s/^HH::Model:://;
        $MODELS->{$moniker} = $class;
    }
}

sub model {
    my $c =  shift;
    my $moniker= shift;
    my $args   = shift || {};
    return $MODELS->{$moniker}->new( $args );
}


EOC;
