class git {
  package { 'git':
    ensure => 'latest',
  }

  file {
    '/home/vagrant/.gitconfig':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/git/gitconfig',
  }

  file {
    '/home/vagrant/.gitignore':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/git/gitignore',
  }
}
