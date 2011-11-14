use Test::More;

use_ok('HH::Cache::Session');

my $cache = HH::Cache::Session->instance();
isa_ok($cache,'Cache::Memcached::IronPlate');

$cache->remove('hige');
is($cache->get('hige'),undef,'no data');

$cache->set('hige','hige');
is($cache->get('hige'),'hige','has data');

done_testing();
