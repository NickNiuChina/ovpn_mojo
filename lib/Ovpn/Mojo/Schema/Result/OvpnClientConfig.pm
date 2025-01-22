use utf8;
package Ovpn::Mojo::Schema::Result::OvpnClientConfig;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OvpnClientConfig

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ovpn_client_config>

=cut

__PACKAGE__->table("ovpn_client_config");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 ovpn_client

  data_type: 'uuid'
  is_foreign_key: 1
  is_nullable: 0
  size: 16

=head2 http_port

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 https_port

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 http_proxy_template

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 ssh_proxy_port

  data_type: 'integer'
  is_nullable: 0

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
  "ovpn_client",
  { data_type => "uuid", is_foreign_key => 1, is_nullable => 0, size => 16 },
  "http_port",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "https_port",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "http_proxy_template",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "ssh_proxy_port",
  { data_type => "integer", is_nullable => 0 },
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

=head1 RELATIONS

=head2 ovpn_client

Type: belongs_to

Related object: L<Ovpn::Mojo::Schema::Result::OvpnServer>

=cut

__PACKAGE__->belongs_to(
  "ovpn_client",
  "Ovpn::Mojo::Schema::Result::OvpnServer",
  { id => "ovpn_client" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2025-01-22 08:47:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gDqVob7burbBAg3JVziH5Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
