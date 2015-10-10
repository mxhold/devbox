class tmux($version) {
  package { 'libevent-dev':
    ensure => installed,
  }

  package { 'libncurses-dev':
    ensure => installed,
  }

  package { 'tmux':
    ensure => purged,
  }

  exec {'download':
    cwd     => '/tmp',
    path    => ['/usr/bin', '/bin'],
    command =>
      "wget https://github.com/tmux/tmux/releases/download/${version}/tmux-${version}.tar.gz",
    creates => "/tmp/tmux-${version}.tar.gz"
  }

  exec {'extract':
    cwd     => '/tmp',
    path    => ['/usr/bin', '/bin'],
    command => "tar xfvz tmux-${version}.tar.gz",
    creates => "/tmp/tmux-${version}",
    require => Exec['download']
  }

  exec {'configure':
    cwd     => "/tmp/tmux-${version}",
    path    => ['/usr/bin', '/bin'],
    command => 'bash -c "./configure"',
    creates => "/tmp/tmux-${version}/config.status",
    require => [Package[libevent-dev],
                Package[libncurses-dev],
                Exec[extract]]
  }

  exec {'make':
    cwd     => "/tmp/tmux-${version}",
    path    => ['/usr/bin', '/bin'],
    command => 'bash -c make',
    creates => "/tmp/tmux-${version}/tmux",
    require => Exec['configure']
  }

  exec {'install':
    cwd     => "/tmp/tmux-${version}",
    path    => ['/usr/bin', '/bin'],
    command => 'bash -c "make install"',
    creates => '/usr/local/bin/tmux',
    require => Exec['make']
  }

  file {
    '/home/vagrant/.tmux.conf':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/tmux/tmux.conf';
  }
}
