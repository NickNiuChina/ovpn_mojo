package Ovpn::Mojo::Service::OmDBIx;
use strict;
use warnings;

use Ovpn::Mojo::DB;
use Ovpn::Mojo::Schema;

our $log = Log::Log4perl->get_logger('');

# Service layer

our $dbh;

sub login {
    my $class = shift;
    my ($user, $password) = @_;
    $log->debug("Got login data: $user: $password\n");
    my $schema = Ovpn::Mojo::Schema->connect('dbi:Pg:database=ovpn_mojo', 'postgres', 'postgres');
    $schema->resultset('OmGroups')->search({ name => 'TEST' })->first();
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