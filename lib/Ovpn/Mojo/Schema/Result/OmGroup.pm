use utf8;
use Data::UUID;
package Ovpn::Mojo::Schema::Result::OmGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::OmGroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<om_group>

=cut

__PACKAGE__->table("om_group");

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

=head2 C<user_group_group_key>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("user_group_group_key", ["name"]);

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


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-12-25 13:25:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WdinVb7pr1NUWBpAG/LaBg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

#Currently in constructor check the id value and generate uuid if not
sub new {
  my $class = shift;
  my $self = $class->next::method(@_);
     if (! $self->id ){
         $self->set_column("id", $self->uuid);
  }
  return $self;
}


sub uuid() {
    return lc(Data::UUID->new->create_str) ;
}

1;
