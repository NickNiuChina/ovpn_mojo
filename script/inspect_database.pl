#!/usr/bin/env perl

use strict;
use warnings;

use Mojo::File qw(curfile);
use lib curfile->dirname->sibling('lib')->to_string;
use Mojolicious::Commands;

use DBIx::Class::Schema::Loader qw/ make_schema_at /;

make_schema_at(
    'Ovpn::Mojo::Schema',
    { debug => 1,
      dump_directory => '../dlib',
    },
    [ 'dbi:Pg:dbname="ovpn_mojo"', 'postgres', 'postgres',
       { loader_class => 'MyLoader' } # optionally
    ],
);
