include apt

apt::source { 'debian_testing':
  location => 'http://debian.mirror.iweb.ca/debian/',
  release  => 'testing',
  repos    => 'main contrib non-free',
  pin      => '800',
  allow_unsigned => true, # yolo
}

include utils
include git
include zsh
include tmux
include vim

Class['git'] -> Class['vim']
