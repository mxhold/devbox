class zsh {
  package { 'zsh':
    ensure => present,
  }

  file {
    '/home/vagrant/.zshrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/zsh/zshrc',
  }

  user { "vagrant":
    ensure => present,
    shell => "/bin/zsh",
  }
}
