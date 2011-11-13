use Test::More;

use_ok('HH::Analyzer');

my $analyzer = HH::Analyzer->new();

#$analyzer->analyze('http://blogos.com/');
$analyzer->analyze('http://search.cpan.org/~mirod/HTML-TreeBuilder-XPath-0.14/lib/HTML/TreeBuilder/XPath.pm');



done_testing();
