package MetaCPAN::API::ResultSet;
# ABSTRACT: A Result Set

use Moo;
use Carp;

has scroller => (
    is       => 'ro',
    isa      => sub {
        croak "scroller must be an ElasticSearch::ScrolledSearch object"
            unless ref($_[0]) eq 'ElasticSearch::ScrolledSearch';
    },
    required => 1,
    handles  => [qw/ total /],
);

has type => (
    is       => 'ro',
    isa      => sub {
        croak "invalid type"
            unless grep { $_ eq $_[0] }
                qw/ author distribution favorite file module release /;
    },
    required => 1,
);

has facets => (
    is      => 'ro',
    lazy    => 1,
    builder => '_get_facets',
);

sub _get_facets {
    my $self = shift;

    return $self->scroller->facets || {};
}


sub next {
    my $self = shift;

    my $result = $self->scroller->next;
    defined($result) or return undef;

    my $class  = 'MetaCPAN::API::' . ucfirst $self->type;
    return $class->new_from_request( $result->{'_source'} );
}


1;

__END__

=head1 DESCRIPTION


=head1 ATTRIBUTES

