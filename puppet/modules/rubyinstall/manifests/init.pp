class rubyinstall {
  exec { 'wget-ruby-install':
    cwd => '/tmp',
    command => 'wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz',
    path => ['/usr/bin', '/bin'],
    creates => '/tmp/ruby-install-0.5.0.tar.gz',
  }

  exec { 'extract-ruby-install':
    cwd => '/tmp',
    command => 'tar zxvf ruby-install-0.5.0.tar.gz',
    path => ['/usr/bin', '/bin'],
    creates => '/tmp/ruby-install-0.5.0',
    require => Exec['wget-ruby-install'],
  }

  exec { 'install-ruby-install':
    cwd => '/tmp/ruby-install-0.5.0',
    command => 'make install',
    path => ['/usr/bin', '/bin'],
    require => Exec['extract-ruby-install'],
    creates => '/usr/local/bin/ruby-install',
  }

  file { '/home/vagrant/.rubies':
    owner => 'vagrant',
    group => 'vagrant',
    ensure => 'directory',
  }
}
