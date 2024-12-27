#!/usr/bin/env perl

use autodie;
use strict;
use utf8;
use warnings qw(all);

use Getopt::Long;
use Pod::Usage;
use FindBin;
use lib "$FindBin::Bin/lib";
use Data::Printer;
use Mojo::File qw(curfile);
use lib curfile->dirname->sibling('lib')->to_string;
use Mojolicious::Commands;

use Ovpn::Mojo::Schema;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

# VERSION 20241225

=head1 SYNOPSIS

    ./om_dbix_tool.pl [options]
    
    OPTIONS
        -a,--action [action]
            
                make_schema: read database and generate schema 

                deploy: deploy the schema to database 

                deploy_statements: Generate the deploy sql but not deploy at this time

        -h,--help
            Print this help.

=head1 NAME

    perl script to test or operate DBIx::Class

=head1 DESCRIPTION
    This script act based on action and for DBIx::Class schemas

=cut

GetOptions(
    q(help)             => \my $help,
    q(action=s)           => \my $action,
    q(verbose)          => \my $verbose,
) or pod2usage(q(-verbose) => 1);
pod2usage(q(-verbose) => 1) if $help or !defined $action;

# check if parameter is correct
my @func_params = ('make_schema', 'deploy_statements', 'deploy', 'test');
my %correct_params = map { $_ => 1 } @func_params;

unless (exists($correct_params{$action})){
        print "\nGet incorrect action!\n\n";
        pod2usage(q(-verbose) => 1);
}

my $schema = Ovpn::Mojo::Schema->connect('dbi:Pg:database=ovpn_mojo', 'postgres', 'postgres');

# make_schema
if ($action eq 'make_schema') {
    my $lib_dir = curfile->dirname->sibling('lib')->to_string;
    make_schema_at(
        'Ovpn::Mojo::Schema',
        { debug => 1,
        dump_directory => './lib',
        },
        [ 'dbi:Pg:dbname="ovpn_mojo"', 'postgres', 'postgres'],
    );
}


# deploy_statements
if ($action eq 'deploy_statements') {
    my $deploy_statements = $schema->deployment_statements;
    print "$deploy_statements\n";
}


# deploy
if ($action eq 'deploy') {
    print("Deploy the schema now...\n");
    $schema->deploy;
    print("Schema deploy done.\n");
}

# test
if ($action eq 'test'){
    # ADD
    print "### 1. Add data ### \n"; 
    print "Add test group, name: TEST\n"; 
    my $ug = $schema->resultset('OmGroups')->search({ name => 'TEST' })->first();
    if ($ug) {
        print "\tgroup: Test has been added before. Skip.\n";
    } else {
        print "\tAnd group now： TEST now...";
        my $new_ug = $schema->resultset('OmGroups')->new({"name" => 'TEST'});
        $new_ug->insert;
        print "New group added done.";
    }

    print "Add test user, name: test1\n"; 
    $ug = $schema->resultset('OmGroups')->search({ name => 'TEST' })->first();
    my $u_id = $ug->id;

    my $user = $schema->resultset("OmUsers")->search({ username => 'test1' })->first();
    
    if ($user) {
        print "\tuser: test1 has been added before. Skip.\n";
    } else {
        print "\tAnd user: test1 now...\n";
        my $new_user = $schema->resultset('OmUsers')->new({
            username => 'tes1',
            password => 'test1',
            name => 'name',
            email => 'test1@test1.com',
            group_id => $u_id
            });
        $new_user->insert;
        print "New group added done.\n`";
        p $new_user;
    }


    # SELECT

    # DELETE

    # UPDSTE
}

# prepare test data

# delete test data




__END__

##### if id null
Currently in constructor check the id value and generate uuid if not

sub new {
  my $class = shift;
  my $self = $class->next::method(@_);

  foreach my $col ($self->result_source->columns) {
    my $default = $self->result_source->column_info($col)->{default_value};
        if($default && !defined $self->$col()){
                if (ref $default eq 'SCALAR'){
                        $self->set_column($col, $self->$$default);
                } else {
                        $self->set_column($col, $default)
                }
        }
  }
  # p $self;
  return $self;
}


sub uuid() {
    return Data::UUID->new->create_str ;
}

##### UserGroup.pm if default set
# default value for uuid
# in colomn define : \"uuid" This is currently only used to create tables from your schema.
sub new {
  my $class = shift;
  my $self = $class->next::method(@_);

  foreach my $col ($self->result_source->columns) {
    my $default = $self->result_source->column_info($col)->{default_value};
        if($default && !defined $self->$col()){
                if (ref $default eq 'SCALAR'){
                        $self->set_column($col, $self->$$default);
                } else {
                        $self->set_column($col, $default)
                }
        }
  }
  # p $self;
  return $self;
}


sub uuid() {
    return Data::UUID->new->create_str ;
}


###  Reference ###############################################################################################################
default values

# https://stackoverflow.com/questions/75979451/dbixclass-how-to-retrieve-generated-uuid-on-create
sub create {
    my $self = shift;
    my $qry  = shift;

    return $self->SUPER::create( { %{$qry}, id => Data::UUID->new->create_str } );
}
#  over-wrote the create method to append a pre-generated UUID to the id field before executing the super-classes' create like so




# https://stackoverflow.com/questions/2106504/perl-dbixclass-default-values-when-using-new
sub new {
  my $class = shift;
  my $self = $class->next::method(@_);
  foreach my $col ($self->result_source->columns) {
    my $default = $self->result_source->column_info($col)->{default_value};
    $self->$col($default) if($default && !defined $self->$col());
  return $self;
}


# https://stackoverflow.com/questions/24182342/perl-dbixclass-is-it-possible-to-provide-a-default-value-for-inserting-by-us
with moo




Setting default values for a row

It's as simple as overriding the new method. Note the use of next::method.             
sub new {
  my ( $class, $attrs ) = @_;
  $attrs->{foo} = 'bar' unless defined $attrs->{foo};
  my $new = $class->next::method($attrs);
  return $new;
}
# set column
# $result->set_column($col => $val);
