package HH::PC::Dispatcher;
use Ze::Class;
extends 'HH::WAF::Dispatcher';


sub _build_config_file {
    my $self = shift;
    $self->home->file('etc/router-pc.pl');
}

EOC;
