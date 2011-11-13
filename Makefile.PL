use inc::Module::Install;
name 'HH';
all_from 'lib/HH.pm';


requires (
    'Ze' => 0,
    'FormValidator::LazyWay' => 0,
    'Data::Section::Simple' => 0,
    'Aplon' => 0,
    'DBIx::Sunny' => 0,
);


test_requires(
    'Test::LoadAllModules' => 0,
);


tests_recursive;

build_requires 'Test::More';
auto_include;
WriteAll;
