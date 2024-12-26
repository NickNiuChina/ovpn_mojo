use utf8;
package Ovpn::Mojo::Schema::Result::OmUser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OmUser

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<om_users>

=cut

__PACKAGE__->table("om_users");

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
  { data_type => "integer", is_nullable => 0, default_value => 300},
  "page_size",
  { data_type => "integer", is_nullable => 0, default_value => 50 },
  "status",
  { data_type => "integer", is_nullable => 0, default_value => 1 },
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

Related object: L<Ovpn::Mojo::Schema::Result::OmGroup>

=cut

__PACKAGE__->belongs_to(
  "group",
  "Ovpn::Mojo::Schema::Result::OmGroup",
  { id => "group_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-12-25 13:25:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6P+xRXBLOLthuDi9qG0Yyg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
sub new {
  my $class = shift;
  my $self = $class->next::method(@_);

  if (! $self->id ){
         $self->set_column("id", $self->uuid);
  }

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

1;
