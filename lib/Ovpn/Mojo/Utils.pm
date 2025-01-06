package Ovpn::Mojo::Utils;
use strict;
use warnings;
use Data::Printer;
#use Log::Log4perl;
use Ovpn::Mojo::DB;
use Crypt::Password; 

#
# APP utils
# 

our $log = Log::Log4perl->get_logger('');

sub confirm_super_user {
    my $class = shift;
    # groups
    $log->trace("Check if defaul grops are ready.");
    my @groups = ('ADMIN', 'SUPER', 'USER', 'GUEST');
    for my $group @groups {
        my $ug = $schema->resultset('OmGroups')->search({ name => $group })->first();
        if ($ug) {
            $log->trace("Group: $group is ready. Skip.");
        } else {
            $log->warn("Group: $group is NOT ready. Add it now.");
            my $new_ug = $schema->resultset('OmGroups')->new({"name" => $group});
            $new_ug->insert;
            $log->info("New group: $group added done.");
        }
    }
    $log->trace("Groups check done");
    
    # default user
    $log->trace("Check if defaul super user is ready.");
    my $schema = Ovpn::Mojo::DB->get_schema();
    my $user = $schema->resultset('OmUsers')->search({ username => 'super' })->first();
    if ($user) {
        $log->info("Default super user is ready.");
    } else {
        $log->warn("Defualt super user is NOT ready. Add it now.");
            my $new_user = $schema->resultset('OmUsers')->new({
                username => "super",
                password => password("super"),
                name => "Super",
                email => "super\@test.com",
                group_id => $u_id
                });
            $new_user->insert;
    }
}

1;
