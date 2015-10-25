class elixir {
  package { 'elixir':
    ensure => 'latest',
    require => [Apt::Source['debian_testing']],
  }
}
