package Ovpn::Mojo::Utils;
use strict;
use warnings;
use Data::Printer;
#use Log::Log4perl;
use Ovpn::Mojo::DB;
use Crypt::Password; 
use Config;
use Time::Piece;
use Unix::Uptime;
use Sys::CpuAffinity;
use Sys::MemInfo qw(totalmem freemem totalswap freeswap);

#
# APP utils
# 

our $log = Log::Log4perl->get_logger('');

sub confirm_default_user {
    my $class = shift;
    my $schema = Ovpn::Mojo::DB->get_schema();
    # groups
    $log->trace("Check if defaul grops are ready.");
    my @groups = ('ADMIN', 'SUPER', 'USER', 'GUEST');
    my $ug = '';
    for my $group (@groups) {
        $ug = $schema->resultset('OmGroups')->search({ name => $group })->first();
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
    my $user = $schema->resultset('OmUsers')->search({ username => 'super' })->first();
    if ($user) {
        $log->info("Default super user is ready.");
    } else {
        $log->warn("Defualt super user is NOT ready. Add it now.");
	$ug = $schema->resultset('OmGroups')->search({ name => 'SUPER' })->first();
        my $u_id = $ug->id;
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


sub get_system_info {
    # refer to _END_ for return sample 
    my $class = shift;
    my $system_info = {};
    $system_info->{system_type} = $Config{osname};
    $system_info->{system_version} = $Config{osvers};
    $system_info->{system_time} = Time::Piece::localtime->strftime('%Y-%m-%d_%H:%M:%S');;

    $system_info->{cpu_cores} = Sys::CpuAffinity::getNumCpus();

    my $uptime = Unix::Uptime->uptime(); # 2345
    my $start = localtime;
    my $end = $start + int($uptime);
    my $duration = ($end - $start)->pretty;
    $system_info->{system_uptime} = $duration;

    my ($load1, $load5, $load15) = Unix::Uptime->load(); # (1.0, 2.0, 0.0)
    $system_info->{load_avg} = [$load1, $load5, $load15];

    my $memory_total = int(&totalmem / 1024/1024 * 10 + 0.5)/10;
    my $memory_used = int((&totalmem - &freemem)/1024/1024 * 10 + 0.5)/10;
    $system_info->{memory_total} = $memory_total;
    $system_info->{memory_used} = $memory_used;
    $system_info->{memory_percent} = int(($memory_used / $memory_total * 1000.0) + 0.5) / 10.0;

    my $swap_total = &totalswap / 1024/1024;
    my $swap_used = (&totalswap - &freeswap)/1024/1024;
    $system_info->{swap_total} = $swap_total;
    $system_info->{swap_used} = $swap_used;
    $system_info->{swap_percent} = $swap_total ? int(($memory_used / $memory_total * 1000.0) + 0.5) / 10.0 : 0 ;
    
    $system_info->{openvpn_version} = get_openvpn_version();

    $system_info->{system_information} = $Config{archname};

    return $system_info;
}

sub get_openvpn_version {

    my @cmd_output = '';
    if (! system("openvpn --version")) {
	@cmd_output = qx(openvpn --version);
    }
    if (! system("/usr/sbin/openvpn --version")) {
	@cmd_output = qx(/usr/sbin/openvpn --version);
    }

    my $result = $cmd_output[0];

    return $result;
}

1;

__END__

$system_info = {
    system_type => $system_type,
    system_version => $platform->release(),
    system_time => $datetime,
    cpu_cores => $cpu_count,
    system_uptime => $uptime_str,
    load_avg => $load_avg,
    memory_total => $memory_total,
    memory_used => $memory_used,
    memory_percent => $memory_percent,
    swap_total => $swap_total,
    swap_used => $swap_used,
    swap_percent => $swap_percent,
    openvpn_version => $openvpn_version,
    system_information => $system_information
}
