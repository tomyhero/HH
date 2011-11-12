package HH::PC::View;
use Ze::Class;
extends 'Ze::WAF::View';
use HH::Home;
use Ze::View;

sub _build_engine {
    my $self = shift;
    my $path = HH::Home->get()->subdir('view-test');
    return Ze::View->new(
        engines => [
            { engine => 'Ze::View::Xslate' , config => { path => $path } }, 
            { engine => 'Ze::View::JSON', config  => {} } 
        ]
    );

}


EOC;
