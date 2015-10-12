class ruby {
  exec { 'download-ruby-2.2.1':
    cwd => '/tmp',
    command => 'wget https://rvm.io/binaries/ubuntu/14.04/x86_64/ruby-2.2.1.tar.bz2',
    path => ['/usr/bin', '/bin'],
    creates => '/tmp/ruby-2.2.1.tar.bz2',
  }

  exec { 'extract-ruby-2.2.1':
    cwd => '/tmp',
    command => 'bzip2 -cd ruby-2.2.1.tar.bz2 | tar xf -',
    path => ['/usr/bin', '/bin'],
    creates => '/tmp/ruby-2.2.1',
    require => Exec['download-ruby-2.2.1'],
  }

  file { '/home/vagrant/.rubies':
    owner => 'vagrant',
    group => 'vagrant',
    ensure => 'directory',
  }

  exec { 'move-ruby-2.2.1':
    cwd => '/tmp',
    command => 'mv ruby-2.2.1 /home/vagrant/.rubies/',
    path => ['/usr/bin', '/bin'],
    creates => '/home/vagrant/.rubies/ruby-2.2.1',
    require => [Exec['extract-ruby-2.2.1'], File['/home/vagrant/.rubies']],
  }
}
