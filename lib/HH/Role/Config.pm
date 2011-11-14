package HH::Role::Config;
use Ze::Role;
use HH::Config;

sub config {
    HH::Config->instance();
}


1;
