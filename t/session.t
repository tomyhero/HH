use Test::More;
use HTTP::Request;
use HTTP::Response;
use HTTP::Message::PSGI;
use Ze::WAF::Request;

use_ok('HH::Session');

my $env  = HTTP::Request->new( GET => 'http://localhost/' )->to_psgi;
my $req = Ze::WAF::Request->new( { env => $env } );
my $res = $req->new_response;
my $session = HH::Session->create($req,$res);

$session->set('hoge','hoge');

is($session->get('hoge'),'hoge');




done_testing();
