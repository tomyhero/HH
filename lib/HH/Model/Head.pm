package HH::Model::Head;
use Ze::Class;
use HH::Analyzer;
extends 'HH::Model::Base';


sub profiles {
    {
        analyze =>  {
            required => [qw/url/],
        }

    }
}

sub analyze {
    my $self = shift;
    my $args = shift || {};
    my $v = $self->assert_with($args);
    my $analyzer = HH::Analyzer->new();

    my $res = $analyzer->analyze( $v->{url} );

    return $res;
}

EOC;
