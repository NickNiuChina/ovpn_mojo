package Ovpn::Mojo::Service::OmDBIx;
use strict;
use warnings;

use Ovpn::Mojo::DB;


our $log = Log::Log4perl->get_logger('');

# Service layer

our $dbh;

sub login {
    my $class = shift;
    my ($user, $passwor) = @_;
    $log->debug("Got login data: $user: $password\n");
    return $result;
}

sub connect {
    my $class = shift;
    $c = shift;
    return Ovpn::Mojo::DB->connect($c);
}

