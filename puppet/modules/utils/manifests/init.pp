class utils {
  package { ['htop', 'tree', 'unzip']:
    ensure => present,
  }
}
