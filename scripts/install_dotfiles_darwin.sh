#!/bin/bash

echo "Install from dotfiles"

script_dir="$(dirname "$0")"


mkdir -p ~/.my/dotfiles

# TODO add args checki for devdiva (or just assume this is always there?
if [[ "$OSTYPE" == "darwin19"* ]]; then
  
  # get dotfiles
  git clone git@github.com:devdiva/dotfiles.git -b darwin19 ~/.my/dotfiles
  if [[ $? != 0 ]] ; then
    git -C ~/.my/dotfiles pull
  fi  

  # create workspace directories
  while read -r mydir; do
    `mkdir -p ~/workspace/$mydir` ;
  done < ~/.my/dotfiles/dirs/workspace.txt

  # brew install
  while read -r formula; do
    brew ls --versions $formula > /dev/null
    if [[ $? == 0 ]] ; then
      echo "$formula already installed"
    else
      brew install $formula
    fi
  done < ~/.my/dotfiles/brew/formulae.txt

  # works
  #[[ -f ~/.my/dotfiles/rust/profiles.txt ]] && source "$script_dir/install_rust_darwin.sh"
  
  if [[ -f ~/.my/dotfiles/rust/profiles.txt ]] ; then
    source "$script_dir/install_rust_darwin.sh"
  fi
fi



