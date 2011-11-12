package HH::WAF::Context;
use Ze::Class;
extends 'Ze::WAF::Context';

__PACKAGE__->load_plugins( 'Ze::WAF::Plugin::Encode' );

EOC;
