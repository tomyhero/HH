package HH::Cache::Page;
use strict;
use warnings;
use base 'Class::Singleton';
use HH::Config;
use Cache::Memcached::IronPlate;
use Cache::Memcached::Fast;

sub _new_instance {
    my $self = shift;
    my $servers = HH::Config->instance->get('cache_page');
    return Cache::Memcached::IronPlate->new( 
        cache => Cache::Memcached::Fast->new({
            utf8 => 1,
            servers => $servers,
            compress_threshold => 5000,
            ketama_points => 150,
            namespace => 'HHP',    
        }) 
    );
}

1;
