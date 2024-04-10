package Mojolicious::Plugin::Sessionless;
use v5.26;
use warnings;

# ABSTRACT: Installs noop handlers to disable Mojolicious sessions

use experimental qw(signatures);

use Mojo::Base 'Mojolicious::Plugin';

sub register($self, $app, $conf) {
  $app->sessions(bless({},'__Sessionless'));
  { no strict 'refs';
    *{'__Sessionless::load'} = *{'__Sessionless::store'} = sub{};
  }
}

1;
