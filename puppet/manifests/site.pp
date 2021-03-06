include apt

apt::source { 'debian_testing':
  location => 'http://debian.mirror.iweb.ca/debian/',
  release  => 'testing',
  repos    => 'main contrib non-free',
  pin      => '800',
  allow_unsigned => true, # yolo
}

Apt::Source['debian_testing'] -> Class["apt::update"] -> Package <| |>

include utils
include git
include zsh
include tmux
include vim
include rubyinstall
include postgres
include erlang
include elixir

ruby { 'ruby-1.9.3':
  version => '1.9.3-p551',
}

ruby { 'ruby-2.0.0':
  version => '2.0.0-p598',
}

ruby { 'ruby-2.2.1':
  version => '2.2.1',
}

ruby { 'ruby-2.1.5':
  version => '2.1.5',
}

include chruby
include powerline

Class['git'] -> Class['vim']
Class['erlang'] -> Class['elixir']
