use utf8;
package Ovpn::Mojo::Schema::Result::OvpnClients;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OvpnClients

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ovpn_clients>

=cut

__PACKAGE__->table("ovpn_clients");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 server

  data_type: 'uuid'
  is_foreign_key: 1
  is_nullable: 0
  size: 16

=head2 site_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 cn

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 toggle_time

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 expire_date

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 create_time

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 update_time

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "uuid", is_nullable => 0, size => 16 },
  "server",
  { data_type => "uuid", is_foreign_key => 1, is_nullable => 0, size => 16 },
  "site_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "cn",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "toggle_time",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "expire_date",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "create_time",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "update_time",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<ovpn_clients_cn_key>

=over 4

=item * L</cn>

=back

=cut

__PACKAGE__->add_unique_constraint("ovpn_clients_cn_key", ["cn"]);

=head1 RELATIONS

=head2 server

Type: belongs_to

Related object: L<Ovpn::Mojo::Schema::Result::OvpnServer>

=cut

__PACKAGE__->belongs_to(
  "server",
  "Ovpn::Mojo::Schema::Result::OvpnServer",
  { id => "server" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-12-25 13:25:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4GQv59YBI95hd06BMxxT6A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
