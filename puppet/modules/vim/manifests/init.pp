class vim {
  include apt

 # apt::ppa { 'ppa:neovim-ppa/unstable': }

 # package { 'neovim':
 #   ensure => 'latest',
 #   require => [Apt::Ppa['ppa:neovim-ppa/unstable']],
 # }

  package { 'vim-nox':
    ensure => 'latest',
  }

  file {[
    '/home/vagrant/.vim',
    '/home/vagrant/.vim/colors',
    '/home/vagrant/.vim/autoload',
    '/home/vagrant/.vim/bundle',
  ]:
    owner => 'vagrant',
    group => 'vagrant',
    ensure => directory,
    require => Package['vim-nox'],
  }

  file {
    '/home/vagrant/.vimrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/vim/vimrc',
  }

  file {
    '/home/vagrant/.vim/colors/grb256.vim':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/vim/grb256.vim',
      require => File['/home/vagrant/.vim/colors'],
  }

  exec { 'clone-vundle':
    command => "git clone https://github.com/gmarik/Vundle.vim /home/vagrant/.vim/bundle/Vundle.vim",
    path => ["/usr/bin", "/usr/local/bin"],
    creates => "/home/vagrant/.vim/bundle/Vundle.vim",
    require => File['/home/vagrant/.vim/bundle'],
    user => "vagrant",
  }

  exec { 'install-plugins':
    command => '/usr/bin/vim "+PluginInstall" "+qall"',
    user => "vagrant",
    environment => ["HOME=/home/vagrant", "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"],
    cwd => "/home/vagrant",
    require => [File['/home/vagrant/.vimrc'], Exec['clone-vundle']],
  }
}
