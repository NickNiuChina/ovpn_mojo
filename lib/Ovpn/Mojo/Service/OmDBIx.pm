package Ovpn::Mojo::Service::OmDBIx;
use strict;
use warnings;

use Data::Printer;
use Ovpn::Mojo::DB;

our $log = Log::Log4perl->get_logger('');

# Service layer

our $dbh;

sub login {
    my $class = shift;
    my ($user, $password) = @_;
    chomp $user;
    chomp $password;
    $log->debug("Got login data: $user: $password\n");
    my $schema = Ovpn::Mojo::DB->get_schema();
    $schema->resultset('OmUsers')->search({ username => $user })->first();
    $log->debug(np $schema);
    return;
}

sub connect {
    my $class = shift;
    return Ovpn::Mojo::DB->connect();
}

sub get_connect {
    my $class = shift;
    return Ovpn::Mojo::DB->get_schema();
}

1;