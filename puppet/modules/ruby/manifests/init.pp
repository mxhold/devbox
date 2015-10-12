define ruby($version) {
  exec { "download-ruby-${version}":
    cwd => '/tmp',
    command => "wget https://rvm.io/binaries/ubuntu/14.04/x86_64/ruby-${version}.tar.bz2",
    path => ['/usr/bin', '/bin'],
    creates => "/tmp/ruby-${version}.tar.bz2",
  }

  exec { "extract-ruby-${version}":
    cwd => '/tmp',
    command => "bzip2 -cd ruby-${version}.tar.bz2 | tar xf -",
    path => ['/usr/bin', '/bin'],
    creates => "/tmp/ruby-${version}",
    require => Exec["download-ruby-${version}"],
  }

  exec { "move-ruby-${version}":
    cwd => '/tmp',
    command => "mv ruby-${version} /home/vagrant/.rubies/",
    path => ['/usr/bin', '/bin'],
    creates => "/home/vagrant/.rubies/ruby-${version}",
    require => [Exec["extract-ruby-${version}"], File['/home/vagrant/.rubies']],
  }
}
