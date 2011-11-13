package HH::Analyzer::Result;
use Ze::Class;

has 'head_html' => ( is => 'rw' );
has 'nodes' => ( is => 'rw' );
has 'data' => ( is => 'rw' );

sub BUILD {
    my $self = shift;
    my $data = {};
    $data->{static} = $self->build_static();
    $data->{title}  = $self->build_title();
    $data->{base}   = $self->build_base();
    $data->{meta}   = $self->build_meta();
    $data->{link}   = $self->build_link();
    $data->{style}  = $self->build_style();

    $self->data($data);
}

sub build_title  {
    my $self = shift;
    my $data = {};
    for(@{$self->nodes}){
        if( $_->tag eq 'title') {
            $data->{value}  = $_->as_text;
        }
    }

    return $data;
}

sub build_base {
    my $self = shift;
    my $data = {};


    for(@{$self->nodes}){
        if( $_->tag eq 'base') {
            my %attr = $_->all_external_attr();
            $data->{attr} = \%attr;
        }
    }

    return $data;
}

sub build_meta {
    my $self = shift;
    my @data = ();

    for(@{$self->nodes}){
        if( $_->tag eq 'meta') {
            my %attr = $_->all_external_attr();
            
            my $item = { attr => \%attr };
            push @data,$item;
        }
    }

    return \@data;



}
sub build_link {
    my $self = shift;
    my @data = ();

    for(@{$self->nodes}){
        if( $_->tag eq 'link') {
            my %attr = $_->all_external_attr();
            
            my $item = { attr => \%attr };
            push @data,$item;
        }
    }

    return \@data;

}
sub build_style {
    my $self = shift;
    my @data = ();

    for(@{$self->nodes}){
        if( $_->tag eq 'style') {
            my %attr = $_->all_external_attr();
            
            my $item = { attr => \%attr };
            push @data,$item;
        }
    }

    return \@data;

}

sub build_static {
    my $self = shift;

    my $static = {};
    for(@{$self->nodes}){
        $static->{$_->tag} ||= 0;
        $static->{$_->tag}++;
    }

    return $static;
}


EOC;
