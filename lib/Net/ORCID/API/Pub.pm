package Net::ORCID::API::Pub;

use strict;
use warnings;
use namespace::clean;
use utf8;
use JSON qw(decode_json);
use Moo;

with 'Net::ORCID::API::Common';

sub _build_url {
    my ($self) = @_;
    $self->sandbox ? 'http://pub.sandbox-1.orcid.org'
                   : 'http://pub.orcid.org';
}

sub get_profile {
    my ($self, $orcid) = @_;
    my $url = $self->url;
    my $res = $self->_t->get("$url/$orcid/orcid-profile", undef, {'Accept' => 'application/orcid+json'});
    decode_json($res);
}

sub get_bio {
    my ($self, $orcid) = @_;
    my $url = $self->url;
    my $res = $self->_t->get("$url/$orcid/orcid-bio", undef, {'Accept' => 'application/orcid+json'});
    decode_json($res);
}

sub get_works {
    my ($self, $orcid) = @_;
    my $url = $self->url;
    my $res = $self->_t->get("$url/$orcid/orcid-works", undef, {'Accept' => 'application/orcid+json'});
    decode_json($res);
}

sub search_bio {
    my ($self, $params) = @_;
    my $url = $self->url;
    my $res = $self->_t->get("$url/search/orcid-bio", $params, {'Accept' => 'application/orcid+json'});
    decode_json($res);
}

1;
