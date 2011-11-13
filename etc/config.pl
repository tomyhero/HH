use HH::Home;
my $home = HH::Home->get();
return +{
    db => {
        dsn => 'dbi:SQLite:dbname=' . $home->file('var/hh.db'),
        user => '',
        password => '',
    }
};
