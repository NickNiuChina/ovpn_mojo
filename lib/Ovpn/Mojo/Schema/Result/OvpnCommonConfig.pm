use utf8;
package Ovpn::Mojo::Schema::Result::OvpnCommonConfig;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OvpnCommonConfig

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ovpn_common_config>

=cut

__PACKAGE__->table("ovpn_common_config");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 plain_req_file_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 encrypt_req_file_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 plain_cert_file_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 encrypt_cert_file_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 zip_cert_dir

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "uuid", is_nullable => 0, size => 16 },
  "plain_req_file_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "encrypt_req_file_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "plain_cert_file_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "encrypt_cert_file_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "zip_cert_dir",
  { data_type => "varchar", is_nullable => 0, size => 200 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-12-24 09:21:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pf/xONfv8GNZtUfqFVF/fg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
