#!/bin/bash

echo "Install Rust for OS X (darwin)"

echo "Checkinf for rust"
rustc --version
if [[ $? != 0 ]] ; then
  echo "Rust not found. Installing..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  
  source $HOME/.cargo/env

  # add rustup tab completions for bssh  
  mkdir -p ~/.local/share/bash-completion/completions
  rustup completions bash >> ~/.local/share/bash-completion/completions/rustup

  # add rustup tab completion for zsh - TODO 

else
  echo "Rust already installed."
  rustup update
fi
