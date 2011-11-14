package HH::Session;
use strict;
use warnings;
use HTTP::Session;
use HTTP::Session::Store::Memcached;
use HTTP::Session::State::Cookie;
use HH::Cache::Session;
use HH::Config;

sub create {
    my $class = shift;
    my $req = shift;
    my $res = shift;
    my $cookie_config =  HH::Config->instance()->get('cookie_session');

    my $session = HTTP::Session->new(
        store => HTTP::Session::Store::Memcached->new( memd =>  HH::Cache::Session->instance ),
        state => HTTP::Session::State::Cookie->new( name => $cookie_config ),
        request => $req,
    );

    # http headerをセットしてる程度なのでとりあえずここでもおk
    $session->response_filter($res);
    return $session;
}

1;
