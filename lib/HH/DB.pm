package HH::DB;
use HH::Config;
use DBIx::Sunny;
use Ze;

sub get_dbh {
    my $class = shift;
    my $config = HH::Config->instance()->{db};
    if( $Ze::GLOBAL->{dbi} && $Ze::GLOBAL->{dbi}->ping ) {
        # ok
    }
    else {
        $Ze::GLOBAL->{dbi} 
            = DBIx::Sunny->connect(
                $config->{dsn},
                $config->{user},
                $config->{password},
                {
                    PrintError => 0,
                    RaiseError => 1,
                    sqlite_unicode => 1,
                }
            );
    }

    return $Ze::GLOBAL->{dbi};
}


1;
