package Ovpn::Mojo::DB;
use strict;
use warnings;
use DBI;
use Data::Printer;
use YAML;
use FindBin;
use File::Basename;
use Log::Log4perl;

#
# DB interface
# 

our $dbh;
our $schema;
our $log = Log::Log4perl->get_logger('');

sub get_config {
    my $ab_path = dirname(__FILE__);
    $log->info("Get the YAML config file.");
    $log->info("ab_path: $ab_path");
    my $config_file = "$ab_path/../../../ovpn-mojo.yml";
    my $config = YAML::LoadFile($config_file);
    $log->info("config file: $config_file");
    $log->debug("config detail: ");
    $log->debug(np $config->{db});

    return $config->{db};
}

sub connect {   

    my $self = shift;

    $log->info("Running to DB interface.");
    $log->info("Trying parse the YAML config file.");
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
        $log->warn('Connect when already connected');  
        $log->info("Clean the old connection info.");   
        $dbh = undef;  
    } 

    my $tries = 0;
    do {
        eval {
            $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
        };
        if ((!$dbh) && (++$tries < 5)) {
            $log->fatal('connect failed: %s', $DBI::errstr ? $DBI::errstr : 'unknown');
            $log->info('will retry in 10');
            sleep 5;
        }
    } while (!$dbh && ($tries < 5));

    $log->info("Giving up on connect") if !$dbh;
    $log->info("DB interface done.");  
    return $dbh;   
}

sub get_schema {   

    my $self = shift;

    $log->info("Running to DB interface.");
    $log->info("Trying parse the YAML config file.");
    my $config = $self->get_config;
    # p ($config);
    my $driver   = $config->{driver};
    my $database = $config->{dbname};
    my $host = $config->{host};
    my $port = $config->{port};
    my $dsn = "DBI:$driver:dbname=$database;host=$host;port=$port";
    my $uname = $config->{uname};
    my $password = $config->{passwd};
    
    if ($schema) {   
        $log->warn('Connect when already connected');  
        $log->info("Clean the old schema connection info.");   
        $schema = undef;  
    } 

    my $tries = 0;
    do {
        eval {
            $schema = Ovpn::Mojo::Schema->connect("$dsn", "$uname", "$password") or die $DBI::errstr;
        };
        if ((!$schema) && (++$tries < 5)) {
            $log->fatal('connect failed: %s', $DBI::errstr ? $DBI::errstr : 'unknown');
            $log->info('will retry in 10');
            sleep 5;
        }
    } while (!$schema && ($tries < 5));

    $log->info("Giving up on connect") if !$schema;
    $log->info("DB interface done.");  
    return $schema;   
}

sub disconnect {   
    my $class = shift;

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