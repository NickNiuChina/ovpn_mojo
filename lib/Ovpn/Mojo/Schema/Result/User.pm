use utf8;
package Ovpn::Mojo::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 group_id

  data_type: 'uuid'
  is_foreign_key: 1
  is_nullable: 0
  size: 16

=head2 line_size

  data_type: 'integer'
  is_nullable: 0

=head2 page_size

  data_type: 'integer'
  is_nullable: 0

=head2 status

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "uuid", is_nullable => 0, size => 16 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "group_id",
  { data_type => "uuid", is_foreign_key => 1, is_nullable => 0, size => 16 },
  "line_size",
  { data_type => "integer", is_nullable => 0 },
  "page_size",
  { data_type => "integer", is_nullable => 0 },
  "status",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<Ovpn::Mojo::Schema::Result::UserGroup>

=cut

__PACKAGE__->belongs_to(
  "group",
  "Ovpn::Mojo::Schema::Result::UserGroup",
  { id => "group_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-12-25 09:24:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ykaFAZ934RPEan9WNZejiA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
