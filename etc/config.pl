use HH::Home;
my $home = HH::Home->get();
return +{
    db => {
        dsn => 'dbi:SQLite:dbname=' . $home->file('var/hh.db'),
        user => '',
        password => '',
    },
    cookie_session => 'hhs',
    cache_session => [ '127.0.0.1:11211' ]

};
