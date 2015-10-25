class erlang {
  package { 'erlang':
    ensure => 'latest',
    require => [Apt::Source['debian_testing']],
  }
}
