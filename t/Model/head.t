use Test::More;
use_ok('HH::Model::Head');

my $model = HH::Model::Head->new();


# use Test::Exception;
# throws_ok { $model->analyze() } 'Applon::Error';

subtest 'requred' => sub {
    eval {
        $model->analyze();
    };

    if($@){
        is(ref $@,'Aplon::Error');
    }
    else {
        fail('ooops requred!');
    }

};

subtest 'validate pass' => sub {
    my $res = $model->analyze( { url => "http://blogos.com/" } );
    isa_ok($res,'HH::Analyzer::Result');
};


done_testing();
