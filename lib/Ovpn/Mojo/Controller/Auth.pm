package Ovpn::Mojo::Controller::Auth;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Ovpn::Mojo::DB;
use Ovpn::Mojo::Service::OmDBIx;

# This action will render a template
sub index ($c) {
    # Render template "somedir/fn.html.ep" with message
    return $c->redirect_to('index');
}

sub login ($c) {
    if ($c->req->method eq 'GET') {
        my $dbh = Ovpn::Mojo::DB->connect();
        $c->stash( error   => $c->flash('error') );
        $c->stash( message => $c->flash('message') );
        $c->render(template => 'auth/login');
    } 
    if ($c->req->method eq 'POST') {
        # Get the user name and password from the page
        my $username = $c->param('username');
        my $password = $c->param('password');
        my $remember = $c->param('remember');

        # debug info
        $c->log->debug("Trying login");
        $c->log->debug("Username input: $username");
        $c->log->debug("Pssword input: $password");

        my $user = Ovpn::Mojo::Service::OmDBIx->login($username, $password);

        if ($user) {
            # Creating session
            $c->session(is_auth => 1);             # set the logged_in flag
            $c->session(username => $user->username);
            $c->session(group => $user->group->name);
	    if ($remember eq 'on'){
		$c->session(expiration => int(60*60*24*7));
	    } else {
                $c->session(expiration => int ($c->config->{session_expiration}));
	    }
	    # $c->flash( error => 'Logged in successfully!!' );
            $c->redirect_to('index')
        } else {
            $c->flash( error => 'Invalid User/Password, please try again' );
            return $c->redirect_to("login");
        }
    }
}

sub auth_check {
    my $c = shift;
    my $username = $c->session->{username};
    # checks if session flag (is_auth) is already set
    # return 1 if $c->session('is_auth');
    if ($c->session('is_auth')){
      # $c->stash(username => $username);  # this variable accessable in template
      if (exists $c->session->{lang}) {
          # $c->languages('en');
          $c->languages($c->session->{lang});
        }
      if (grep (/zh/, $c->languages)) {
          $c->config->{current_language} = '中文';
      } else {
          $c->config->{current_language} = 'EN';
      }
      return 1;
    }
    # If session flag not set re-direct to login page again.
    # $c->redirect_to(template => "myTemplates/login", error_message =>  "You are not logged in, please login to access this website");
    # return;
    # $c->stash( error   => $c->flash('error') );
    # $c->stash( message => $c->flash('message') );
    # $c->render(template => 'base/login');
    # return;
    $c->log->debug("Previous URL:" . $c->req->url);
    $c->redirect_to('login');
    return undef;  
}

sub logout ($c) {
    # Remove session and direct to logout page
    $c->session(expires => 1);  #Kill the Session
    return $c->redirect_to("login");
}

sub show_help ($c) {
    $c->render(template => 'auth/base');
}

1;
