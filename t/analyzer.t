use Test::More;

use_ok('HH::Analyzer');

my $analyzer = HH::Analyzer->new();

my $res = $analyzer->analyze('http://blogos.com/');
#$analyzer->analyze('http://yahoo.co.jp/');

isa_ok($res,'HH::Analyzer::Result');


done_testing();
