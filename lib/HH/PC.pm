package HH::PC;
use Ze::Class;
extends 'Ze::WAF';

__PACKAGE__->context_class('HH::PC::Context');
__PACKAGE__->dispatcher_class('HH::PC::Dispatcher');
__PACKAGE__->view_class('HH::PC::View');

EOC;
