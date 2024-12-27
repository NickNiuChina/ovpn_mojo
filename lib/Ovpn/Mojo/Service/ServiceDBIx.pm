package Ovpn::Mojo::ServiceDBIx;
use strict;
use warnings;

use Ovpn::Mojo::DB;

# Service layer

our $dbh;

sub login {
    my $class = shift;
    $c = shift;
}

sub connect {
    my $class = shift;
    $c = shift;
    return Ovpn::Mojo::DB->connect($c);
}

