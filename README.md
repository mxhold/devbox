# devbox

An Ubuntu 14.04 (Trusty Tahr) machine with the following installed:

  - zsh 5
  - chruby 0
  - ruby 1.9.3p551
  - ruby 2.0.0p598
  - ruby 2.1.5
  - ruby 2.2.1
  - ruby-install 0
  - postgres 9.4
  - erlang 18
  - elixir 1.1
  - tmux 2
  - vim 7.4
  - git 2.6
  - htop 1
  - tree 1
  - unzip 6

## Usage

You'll need to have [vagrant](vagrantup.com) installed.

Then you can run:

    vagrant up
    vagrant ssh

Then, to verify the correct programs were installed, run:

    /vagrant/test.sh
