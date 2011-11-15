package HH::PC::Controller::API;
use Ze::Class;
extends 'HH::WAF::Controller';
use HH::Authorizer::Member;

sub me {
    my ($self,$c) = @_;

    my $authorizer = HH::Authorizer::Member->new( c => $c ); 
    my $member = $authorizer->authorize();

    my $item = {};
    my $is_login = 0;
    if($member){
        for(qw/twitter_user_id name screen_name icon_url/){
            $item->{$_} = $member->{$_};
        }
        $is_login = 1;
    }
    $c->set_json_stash({ item => $item , is_login => $is_login });


}

EOC;
