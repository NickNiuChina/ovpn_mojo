#!/usr/bin/env perl

use strict;
use warnings;

use Mojo::File qw(curfile);
use lib curfile->dirname->sibling('lib')->to_string;
use Mojolicious::Commands;

use DBIx::Class::Schema::Loader qw/ make_schema_at /;

my $lib_dir = curfile->dirname->sibling('lib')->to_string;

make_schema_at(
    'Ovpn::Mojo::Schema',
    { debug => 1,
      dump_directory => $lib_dir,
    },
    [ 'dbi:Pg:dbname="ovpn_mojo"', 'postgres', 'postgres'],
);

__END__

#####
Currently in constructor check the id value and generate uuid if not

##### UserGroup.pm
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