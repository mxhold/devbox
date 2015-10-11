class tmux {
  package { 'tmux':
    ensure => 'latest',
    require => [Apt::Source['debian_testing'], Class['apt::update']],
  }

  file {
    '/home/vagrant/.tmux.conf':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/tmux/tmux.conf',
  }
}
