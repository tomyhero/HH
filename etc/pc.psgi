use strict;
use File::Spec;
use File::Basename;

# XXX
use lib 'lib';
use lib './../Ze/lib';

use Plack::Builder;
use HH::PC;

my $webapp = HH::PC->new;
my $app = $webapp->to_app;

builder {
    $app;
};


