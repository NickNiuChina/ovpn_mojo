package Ovpn::Mojo::Schema;
use base qw/DBIx::Class::Schema/;

# load all Result classes in Ovpn/Mojo/Schema/Result/
__PACKAGE__->load_namespaces();