package Ovpn::Mojo::ServiceDBIx;
use strict;
use warnings;

use Ovpn::Mojo::DB;

# Service layer

our $dbh;

sub login {
    my $class = shift;
    my $c = shift;
    
    return $result;
}

sub connect {
    my $class = shift;
    $c = shift;
    return Ovpn::Mojo::DB->connect($c);
}

