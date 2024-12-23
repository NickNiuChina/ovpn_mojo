use utf8;
package Ovpn::Mojo::Schema::Result::UserGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ovpn::Mojo::Schema::Result::UserGroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_group>

=cut

__PACKAGE__->table("user_group");

=head1 ACCESSORS

=head2 id

  data_type: 'uuid'
  is_nullable: 0
  size: 16

=head2 group

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  { 
    data_type => "uuid", 
    is_nullable => 0, 
    size => 16, 
    default_value => \"uuid",
  },
  "group",
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

=item * L</group>

=back

=cut

__PACKAGE__->add_unique_constraint("user_group_group_key", ["group"]);

=head1 RELATIONS

=head2 users

Type: has_many

Related object: L<Ovpn::Mojo::Schema::Result::User>

=cut

__PACKAGE__->has_many(
  "users",
  "Ovpn::Mojo::Schema::Result::User",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-12-24 09:21:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iP9G+COIy/k0mJ3EDIWqIA


sub new {
  my $class = shift;
  my $self = $class->next::method(@_);
  foreach my $col ($self->result_source->columns) {
    my $default = $self->result_source->column_info($col)->{default_value};
    $self->$col($default) if($default && !defined $self->$col());
  }
  return $self;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
