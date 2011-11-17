package HH::Util;
use strict;
use warnings;
use DateTime;
our $DEFAULT_TIMEZONE = DateTime::TimeZone->new( name => 'local' );


sub now {
    return DateTime->now( time_zone => $DEFAULT_TIMEZONE);
}

1;
