class git {
  package { 'git':
    ensure => 'latest',
    require => [Apt::Source['debian_testing']],
  }
}
