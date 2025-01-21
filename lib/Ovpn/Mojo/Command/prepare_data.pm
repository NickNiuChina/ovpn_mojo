package Ovpn::Mojo::Command::prepare_data;
use Mojo::Base 'Mojolicious::Command', -signatures;

has description => 'Add or delete test data include files for test purpose';
has usage       => "Usage: APPLICATION prepare_data [ACTION]\n";


sub run ($self, @args) {
  
  if (! @args){
      print "\n\tAction missing, see help!\n\n";
      return;
  }
  
  # Leak secret passphrases
  if ($args[0] eq 'secrets') { say for @{$self->app->secrets} }

  # Leak mode
  elsif ($args[0] eq 'mode') { say $self->app->mode }
}

1;
