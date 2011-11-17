package HH::PC::Context;
use Ze::Class;
extends 'HH::WAF::Context';
use HH::Session;
use HH::Config;

my $config = HH::Config->instance();

if( $config->get('debug') ) {
    __PACKAGE__->load_plugins( 'Ze::WAF::Plugin::Encode','Ze::WAF::Plugin::JSON', 'Ze::WAF::Plugin::AntiCSRF');
}
else {
    __PACKAGE__->load_plugins( 'Ze::WAF::Plugin::Encode','Ze::WAF::Plugin::JSON', 'Ze::WAF::Plugin::AntiCSRF', 'HH::WAF::Plugin::PageCache' );

}

sub create_session {
    my $c = shift;
    HH::Session->create( $c->req, $c->res );
}


EOC;
