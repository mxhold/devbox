class chruby {
  exec { 'download-chruby':
    cwd => '/tmp',
    command => 'wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz',
    path => ['/usr/bin', '/bin'],
    creates => '/tmp/chruby-0.3.9',
  }

  exec { 'extract-chruby':
    cwd => '/tmp',
    command => 'tar zvfx chruby-0.3.9.tar.gz',
    path => ['/usr/bin', '/bin'],
    creates => '/tmp/chruby-0.3.9',
    require => Exec['download-chruby'],
  }

  exec { 'install-chruby':
    cwd => '/tmp/chruby-0.3.9',
    command => 'make install',
    path => ['/usr/bin', '/bin'],
    creates => '/usr/local/bin/chruby',
    require => Exec['extract-chruby'],
  }

  file { '/home/vagrant/.zsh.d':
    ensure => 'directory',
  }

  file { '/home/vagrant/.zsh.d/chruby.sh':
    source => 'puppet:///modules/chruby/chruby.sh',
    require => File['/home/vagrant/.zsh.d'],
  }
}
