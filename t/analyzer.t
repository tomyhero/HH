use Test::More;

use_ok('HH::Analyzer');

my $analyzer = HH::Analyzer->new();

$analyzer->analyze('http://blogos.com/');



done_testing();
