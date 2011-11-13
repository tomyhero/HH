use Test::More;

use_ok('HH::Analyzer');

my $analyzer = HH::Analyzer->new();

my $res = $analyzer->analyze('http://blogos.com/');
#$analyzer->analyze('http://yahoo.co.jp/');

is($res->url,'http://blogos.com/');
isa_ok($res,'HH::Analyzer::Result');

my $json = $res->to_json();

ok(utf8::is_utf8($json));


done_testing();
