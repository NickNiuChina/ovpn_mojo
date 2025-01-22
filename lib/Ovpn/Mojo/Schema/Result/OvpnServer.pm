use utf8;
package Ovpn::Mojo::Schema::Result::OvpnServer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OvpnServer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ovpn_servers>

=cut

__PACKAGE__->table("ovpn_servers");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 server_name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 configuration_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 configuration_file

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 status_file

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 log_file_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 log_file

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 startup_type

  data_type: 'integer'
  is_nullable: 0

=head2 startup_service

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 certs_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 learn_address_script

  data_type: 'integer'
  is_nullable: 0

=head2 managed

  data_type: 'integer'
  is_nullable: 0

=head2 management_port

  data_type: 'integer'
  is_nullable: 0

=head2 management_password

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 comment

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 creation_time

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
  "server_name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "configuration_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "configuration_file",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "status_file",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "log_file_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "log_file",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "startup_type",
  { data_type => "integer", is_nullable => 0 },
  "startup_service",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "certs_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "learn_address_script",
  { data_type => "integer", is_nullable => 0 },
  "managed",
  { data_type => "integer", is_nullable => 0 },
  "management_port",
  { data_type => "integer", is_nullable => 0 },
  "management_password",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "comment",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "creation_time",
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

=head2 C<ovpn_servers_server_name_key>

=over 4

=item * L</server_name>

=back

=cut

__PACKAGE__->add_unique_constraint("ovpn_servers_server_name_key", ["server_name"]);

=head1 RELATIONS

=head2 ovpn_client_configs

Type: has_many

Related object: L<Ovpn::Mojo::Schema::Result::OvpnClientConfig>

=cut

__PACKAGE__->has_many(
  "ovpn_client_configs",
  "Ovpn::Mojo::Schema::Result::OvpnClientConfig",
  { "foreign.ovpn_client" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ovpn_clients

Type: has_many

Related object: L<Ovpn::Mojo::Schema::Result::OvpnClient>

=cut

__PACKAGE__->has_many(
  "ovpn_clients",
  "Ovpn::Mojo::Schema::Result::OvpnClient",
  { "foreign.server_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2025-01-22 08:47:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JtYqj1rtpciCKTNhHTtNSA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
