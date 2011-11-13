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
        is(ref $@,'HH::Validator::Error');
    }
    else {
        fail('ooops requred!');
    }

};

my $res;
subtest 'validate pass' => sub {
    $res = $model->analyze( { url => "http://blogos.com/" } );
    isa_ok($res,'HH::Analyzer::Result');
};

subtest 'save' => sub {
    ok($model->save($res));
};


done_testing();
