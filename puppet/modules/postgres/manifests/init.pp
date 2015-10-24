class postgres {
  package { 'postgresql-9.4':
    ensure => 'latest',
  }
}
