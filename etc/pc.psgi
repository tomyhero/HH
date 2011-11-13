use strict;
use File::Spec;
use File::Basename;

# XXX
use lib 'lib';

use Plack::Builder;
use HH::PC;
use HH::Home;

my $home = HH::Home->get;

my $webapp = HH::PC->new;
my $app = $webapp->to_app;

builder {
    enable 'Plack::Middleware::Static',
        path => qr{^/static/}, root => $home->file('htdocs');
    $app;
};


