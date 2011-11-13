use Test::More;

use_ok('HH::DB');

my $dbh =  HH::DB->get_dbh();

isa_ok( $dbh ,'DBIx::Sunny::db');
isa_ok( $Ze::GLOBAL->{dbi},'DBIx::Sunny::db');
ok( $dbh->ping );



done_testing();
