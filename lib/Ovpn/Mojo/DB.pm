package Ovpn::Mojo::DB;
use strict;
use warnings;
use DBI;
use Data::Printer;
use YAML;
use FindBin;
use File::Basename;

#
# DB interface
# 

our $dbh;
our $c;

sub get_config {
    my $ab_path = dirname(__FILE__);
    $c->log->info("Get the YAML config file.");
    $c->log->info("ab_path: $ab_path");
    my $config_file = "$ab_path/../../../ovpn-mojo.yml";
    my $config = YAML::LoadFile($config_file);
    $c->log->info("config file: $config_file");
    $c->log->debug("config detail: ");
    $c->log->debug(np $config->{db});

    return $config->{db};
}

sub connect {   

    my $self = shift;
    # this is the mojolicious crontroller object, contains the db connection info
    $c = shift;
    $c->log->info("Running to DB interface.");
    $c->log->info("Trying path the YAML config file.");
    my $config = $self->get_config;
    # p ($config);
    my $driver   = $config->{driver};
    my $database = $config->{dbname};
    my $host = $config->{host};
    my $port = $config->{port};
    my $dsn = "DBI:$driver:dbname=$database;host=$host;port=$port";
    my $userid = $config->{uname};
    my $password = $config->{passwd};
    
    if ($dbh) {   
        $c->log->warn('Connect when already connected');  
        $c->log->info("Clean the old connection info.");   
        $dbh = undef;  
    } 

    my $tries = 0;
    do {
        eval {
            $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
        };
        if ((!$dbh) && (++$tries < 5)) {
            $c->log->fatal('connect failed: %s', $DBI::errstr ? $DBI::errstr : 'unknown');
            $c->log->info('will retry in 10');
            sleep 5;
        }
    } while (!$dbh && ($tries < 5));

    $c->log->info("Giving up on connect") if !$dbh;
    $c->log->info("DB interface done.");  
    return $dbh;   
}

sub disconnect {   
    my $class = shift;
    my $c = shift;

    if (!$dbh) {   
        return 0;   
    } 
    eval {   
        local $SIG{__DIE__} = sub { return (0); }; 
        local $SIG{__WARN__} = sub { return (0); }; 
        $dbh->disconnect(); 
    }; 
    $dbh = undef;   
    return 1;   
}  

1;