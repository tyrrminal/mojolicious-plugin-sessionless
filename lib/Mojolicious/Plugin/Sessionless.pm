package Mojolicious::Plugin::Sessionless;
use v5.26;
use warnings;

# ABSTRACT: Installs noop handlers to disable Mojolicious sessions

use Mojo::Base 'Mojolicious::Plugin';

use experimental qw(signatures);

sub register($self, $app, $conf) {
  $app->sessions(bless({},'__Sessionless'));
  { no strict 'refs';
    *{'__Sessionless::load'} = *{'__Sessionless::store'} = sub{};
  }
}

1;
