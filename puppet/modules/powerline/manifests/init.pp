class powerline {
  package { 'powerline':
    ensure => 'latest',
    require => [Apt::Source['debian_testing']],
  }
}
