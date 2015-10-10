class utils {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  package { ['htop', 'tree', 'unzip']:
    ensure => present;
  }
}
