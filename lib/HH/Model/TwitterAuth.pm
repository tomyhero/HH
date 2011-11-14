package HH::Model::TwitterAuth;
use Ze::Class;
use Net::Twitter::Lite;
use HH::DB;

extends 'Aplon::Model::OAuth::Consumer::Twitter';
with 'HH::Role::Config';
 
has '+consumer_key' => ( default => sub { shift->config->get('twitter')->{consumer_key} }  );
has '+consumer_secret' => ( default => sub { shift->config->get('twitter')->{consumer_secret} } );

has '+error_class' => (
    default => 'HH::Validator::Error',
);

around 'oauth' => sub {
     my ($next, $self, $args) = @_;
     $args->{callback_url} ||= $self->config->get('twitter')->{callback_url} ;
     my $res = $self->$next($args);
    return $res;
};

sub do_complate {
    my $self = shift;
    my $access_token = shift ;
    my $consumer = $self->consumer;

    my $nt = Net::Twitter::Lite->new(
        consumer_key => $self->consumer_key,
        consumer_secret => $self->consumer_secret,
    );

    $nt->access_token( $access_token->token );
    $nt->access_token_secret( $access_token->secret);
    my $res = $nt->verify_credentials();
    if( ref $res eq 'Net::Twitter::Lite::Error' ){
        # XXX
        die 'xxx';
    }

    my $twitter_id = $res->{id_str};

    my $data = {
        icon_url => $res->{profile_image_url_https}, 
        name => $res->{name},
        screen_name => $res->{screen_name},
        twitter_user_id => $twitter_id,
        twitter_access_token => $access_token->token ,
        twitter_access_token_secret => $access_token->secret,       
    };


    my $dbh = HH::DB->get_dbh();

    my $user = $dbh->select_row('SELECT * FROM member WHERE twitter_user_id = ? ', $data->{twitter_user_id} );
    if(!$user){
        $user = $dbh->query('INSERT INTO member (twitter_user_id,name,screen_name,icon_url) VALUES ( ?,?, ?, ?  )',$data->{twitter_user_id},$data->{name},$data->{screen_name},$data->{icon_url} );
    }
    else {
        $dbh->query('UPDATE member SET name = ?, screen_name = ?,icon_url = ?  WHERE twitter_user_id =  ? ',$data->{name},$data->{screen_name},$data->{icon_url} , $data->{twitter_user_id} );
        $dbh->select_row('SELECT * FROM member WHERE twitter_user_id = ? ', $data->{twitter_user_id} );
    }
    return $user;
}

EOC;
