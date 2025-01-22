use utf8;
package Ovpn::Mojo::Schema::Result::OmGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OmGroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<om_groups>

=cut

__PACKAGE__->table("om_groups");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "uuid", is_nullable => 0, size => 16 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<om_group_name_key>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("om_group_name_key", ["name"]);

=head1 RELATIONS

=head2 om_users

Type: has_many

Related object: L<Ovpn::Mojo::Schema::Result::OmUser>

=cut

__PACKAGE__->has_many(
  "om_users",
  "Ovpn::Mojo::Schema::Result::OmUser",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2025-01-22 08:47:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lODh9eMBut8lLZxbidDsDQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
