#!/bin/bash
if [ -s /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh && chruby 2.2
fi

set -u

function check_program {
  program_name=$1
  expected_version=$2
  version_command=$3
  actual_version=$(eval $version_command 2>/dev/null)
  echo -n "checking for $program_name... "
  if [[ $actual_version == *$expected_version* ]]; then
    echo "yes"
  else
    echo "no"
    echo "Output from running \"$version_command\" did not match:" >&2
    echo "   expected: *$expected_version*" >&2
    echo "     actual: $actual_version" >&2
    echo "Aborting: wrong $program_name version" >&2
    exit 1
  fi
}

check_program "zsh" "zsh 5." "zsh --version"
check_program "chruby" "chruby: 0." "chruby --version"
check_program "ruby" "ruby 1.9.3p551" "chruby 1.9.3 && ruby --version"
check_program "ruby" "ruby 2.0.0p598" "chruby 2.0.0 && ruby --version"
check_program "ruby" "ruby 2.1.5" "chruby 2.1.5 && ruby --version"
check_program "ruby" "ruby 2.2.1" "chruby 2.2.1 && ruby --version"
check_program "ruby-install" "ruby-install: 0." "ruby-install --version"
check_program "postgres" "\(PostgreSQL\) 9.4" "psql --version"
check_program "erlang" "\"18\"" "erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell"
check_program "elixir" "Elixir 1.1" "elixir --version"
check_program "tmux" "tmux 2." "tmux -V"
check_program "vim" "Vi IMproved 7.4" "vim --version | head -1"
check_program "git" "git version 2.6" "git --version"
check_program "htop" "htop 1." "htop --version"
check_program "tree" "tree v1." "tree --version"
check_program "unzip" "UnZip 6." "unzip | head -1"

echo "Success!"
exit 0
