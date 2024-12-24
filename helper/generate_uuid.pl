use strict;
use warnings;
use Data::UUID;

print "uuid: " . Data::UUID->new->create_str . "\n";