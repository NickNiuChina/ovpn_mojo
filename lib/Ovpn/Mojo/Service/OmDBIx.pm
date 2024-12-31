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
    my ($username, $password) = @_;
    chomp $username;
    chomp $password;
    $log->debug("Got login data: $username: $password\n");
    my $schema = Ovpn::Mojo::DB->get_schema();
    my $user = $schema->resultset('OmUsers')->search({ username => $username })->first();
    $log->trace("np print \$user object:");
    $log->trace(np $user);
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