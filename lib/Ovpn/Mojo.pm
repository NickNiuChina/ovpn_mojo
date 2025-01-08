package Ovpn::Mojo;
use Mojo::Base 'Mojolicious', -signatures;
use Mojo::Home;
use Data::Printer;
use Log::Log4perl;
use File::Basename;
use MojoX::Log::Log4perl;
use Ovpn::Mojo::Utils;

# This method will run once at server start
sub startup ($c) {

    # Load configuration from config file
    my $config = $c->plugin('NotYAMLConfig');

    my $home = Mojo::Home->new;
    $home->detect;
    chomp(my $filename = $config->{log}->{filename});

    # use mojo log
    # my $logfile;
    # if ($config->{log}->{relative} eq 'yes') {
    #     $logfile = $home->child($filename);
    # } else {
    #     $logfile = $config->{log}->{filename};
    # }
    # $config->{log}->{log_full_filename} = $logfile;
    # $c->log( Mojo::Log->new( path => $logfile, level => 'trace' ) );
    
    # use legacy log4perl
    my $ab_path = dirname(__FILE__);
    my $config_file = "$ab_path/../../log4perl.conf";
    # Log::Log4perl::init($config_file);
    $c->log( MojoX::Log::Log4perl->new( $config_file ) );

    $c->log->info("*********************************************************************");
    $c->log->info("*********************************************************************");
    $c->log->info("*********        APP STARTED     *********");
    $c->log->info("*********************************************************************");
    $c->log->info("*********************************************************************");
    
    # check default groups and user
    $c->log->trace("Ahout to check default groups and user...");
    Ovpn::Mojo::Utils->confirm_default_user();
    
    # default value for every request
    #$c->defaults({error => '', message => ''});

    # Cron task to update the expire date
    $c->plugin(
        Cron => '0 1 * * *' => sub {
            my $tms = shift;
            my $app = shift;
            my $re;
            my $result;
            $re =`echo "Cron: update clients expire date." >> /var/log/mgmt.log`;
            my $file = '/opt/mgmt_service/vpntool/update-expiredate-cron.pl';
            my $filetun = '/opt/mgmt_service/vpntool/update-expiredate-tun-cron.pl';
            $re =`echo "Will run: /opt/mgmt_service/vpntool/update-expiredate-cron.pl" >> /var/log/mgmt.log`;
            $re =`echo "Will run: /opt/mgmt_service/vpntool/update-expiredate-tun-cron.pl" >> /var/log/mgmt.log`;
            if (-e $file){
                $re =`echo "[info]:Running script to update exipredate." >> /var/log/mgmt.log`;
                $result = `perl $file >> /var/log/mgmt.log 2>&1`;
                $re = `echo "$result\n" >> /var/log/mgmt.log`;
                # for tun server
                $result = `perl $filetun >> /var/log/mgmt.log 2>&1`;
                $re = `echo "$result\n" >> /var/log/mgmt.log`;
            } else {
                $re = `echo "[warn]:Did not find expiredate update script. Skipp!!!!" >> /var/log/mgmt.log`;
            }
        }
    );

    $c->plugin (I18N => {
        namespace => 'Ovpn::Mojo::I18N',
        support_url_langs => [qw(en zh)],
        # no_header_detect => 1
        }
    );
    
    # Configure the application
    $c->secrets($config->{secrets});

    # Router
    my $r = $c->routes;
    
    $r->get('/')->to('Auth#index');

    # Normal and secured routes to controller
    # $r->get('/upload_image')->to(controller => 'UploadImageController', action => 'index');
    $r->any(['GET', 'POST'] => '/mojo/login')->to('Auth#login')->name("login");
    my $auth = $r->under('mojo')->to('Auth#auth_check');
    $r->any(['GET', 'POST'] => '/mojo/logout')->to('Auth#logout')->name("logout");
    

    $auth->get('/tips')->to('Auth#show_help')->name("show_help");
    $auth->get('/language')->to(controller => 'Views', action => 'set_language')->name('set_language');   
    
    # dashboard page
    $auth->any(['GET', 'POST'] => '/dashboard')->to('Views#index')->name('index');    
    
    # openvpn servers
    $auth->any(['GET', 'POST'] => '/servers')->to('Views#servers')->name('ovpn_services');  

    $auth->get('/clientstatus')->to('Views#clientsStatus');
    $auth->post('/clientstatus/list')->to('Views#clientsStatuslist');
    $auth->post('/clientstatus/update')->to('Views#clientStatusUpdate');

    $auth->get('/issue')->to('Views#issuecert');
    $auth->post('/issue/upload')->to('Views#reqUpload');

    $auth->get('/reqs')->to('Views#reqFilesList');
    $auth->post('/reqs/list')->to('Views#reqsClientsListJson');
    $auth->post('/reqs/delete')->to('Views#reqClientsDelete');
    # They can be especially useful for manually matching file names with extensions, rather than using format detection.
    # /music/song.mp3 -> /music/#filename -> {filename => 'song.mp3'}
    $auth->get('/reqs/dl/#filename')->to('Views#reqClientsDownload');
    
    $auth->get('/certed')->to('Views#certedClientsList');
    $auth->post('/certed/list')->to('Views#certedClientsListJson');
    $auth->post('/certed/delete')->to('Views#certedClientsDelete');
    $auth->post('/certed/download')->to('Views#certedClientsDownload');
    $auth->get('/certed/dl/#filename')->to('Views#certedClientsDownload');
    
    #### Add tun mode openvpn server ###############################
    $auth->get('/tunclientstatus')->to('Views#tunClientsStatus');
    $auth->post('/tunclientstatus/list')->to('Views#tunClientsStatuslist');
    $auth->post('/tunclientstatus/update')->to('Views#tunClientStatusUpdate');

    $auth->get('/tunissue')->to('Views#tunIssueCert');
    $auth->post('/tunissue/upload')->to('Views#tunReqUpload');

    $auth->get('/tungenericissue')->to('Views#tunGenericIssueCert');
    $auth->post('/tungenericissue/generate')->to('Views#tunGenericIssueCertGenerate');

    $auth->get('/tunreqs')->to('Views#tunReqFilesList');
    $auth->post('/tunreqs/list')->to('Views#tunReqsClientsListJson');
    $auth->post('/tunreqs/delete')->to('Views#tunReqClientsDelete');
    # They can be especially useful for manually matching file names with extensions, rather than using format detection.
    # /music/song.mp3 -> /music/#filename -> {filename => 'song.mp3'}
    $auth->get('/tunreqs/dl/#filename')->to('Views#tunReqClientsDownload');
    
    $auth->get('/tuncerted')->to('Views#tunCertedClientsList');
    $auth->post('/tuncerted/list')->to('Views#tunCertedClientsListJson');
    $auth->post('/tuncerted/delete')->to('Views#tunCertedClientsDelete');
    $auth->post('/tuncerted/download')->to('Views#tunCertedClientsDownload');
    $auth->get('/tuncerted/dl/#filename')->to('Views#tunCertedClientsDownload');

    $auth->get('/tungenericcerted')->to('Views#tunGenericCertedClientsList');
    $auth->post('/tungenericcerted/list')->to('Views#tunGenericCertedClientsListJson');
    $auth->post('/tungenericcerted/delete')->to('Views#tunGenericCertedClientsDelete');
    $auth->post('/tungenericcerted/download')->to('Views#tunGenericCertedClientsDownload');
    $auth->get('/tungenericcerted/dl/#filename')->to('Views#tunGenericCertedClientsDownload');
    
    # Secrct info pages higher privis required
    $auth->get('/system/session')->to('Views#sys_session')->name('session');
    $auth->get('/system/appConfig')->to('Views#sys_app_config')->name('app_config');
    $auth->get('/system/appAttr')->to('Views#sys_app_attr')->name('app_attr');

    ###### Other Urls test ########
    $r->get('/test')->to(controller => 'Test', action => 'test')->name('test');
    $r->get('/welcome')->to('Example#welcome')->name('welcome');

}

1;
