package HH::Analyzer::Parser;
use Ze::Class;
use HH::Analyzer::Result;
use HTML::TreeBuilder::XPath;


sub parse {
    my $self = shift;
    my $content = shift;

    my $tree = HTML::TreeBuilder::XPath->new_from_content( $content );

    my $nodeset = $tree->findnodes('/html/head/*');
    my $head_html = $tree->findnodes_as_string('/html/head/*');
    my @nodes = $nodeset->get_nodelist;
    my $result = HH::Analyzer::Result->new( head_html  => $head_html , nodes => \@nodes );

    return $result;
}


EOC;
