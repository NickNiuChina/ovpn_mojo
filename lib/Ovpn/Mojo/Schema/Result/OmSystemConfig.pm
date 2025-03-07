use utf8;
package Ovpn::Mojo::Schema::Result::OmSystemConfig;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OmSystemConfig

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<om_system_config>

=cut

__PACKAGE__->table("om_system_config");

=head1 ACCESSORS

=head2 item

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 ivalue

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 category

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "item",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "ivalue",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "category",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</item>

=back

=cut

__PACKAGE__->set_primary_key("item");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2025-01-22 08:47:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QwYvXHJmiBZ0C/QC3XFHOQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
