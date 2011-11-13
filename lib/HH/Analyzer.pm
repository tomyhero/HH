package HH::Analyzer;
use Ze::Class;
use HH::Analyzer::Parser;
use LWP::UserAgent;
use Aplon::Error;

sub analyze {
    my $self = shift;
    my $url  = shift;

    my $response = $self->get_response( $url );
    my $content = $self->get_content( $response );
    my $parser = HH::Analyzer::Parser->new();
    return $parser->parse($content);

}


sub get_content {
    my $self = shift;
    my $response = shift;
    return $response->decoded_content();
}

sub get_response {
    my $self = shift;
    my $url  = shift;

    my $ua = LWP::UserAgent->new();
    $ua->timeout(3);
    my $response = $ua->get($url);

    if($response->is_success && $response->content_is_html ){
        return $response;
    }
    else {
        my $error_obj = Aplon::Error->new();
        $error_obj->custom_invalid( [ 'GET_RESPONSE_ERROR' ]);
        die $error_obj;
    }

}

EOC;
