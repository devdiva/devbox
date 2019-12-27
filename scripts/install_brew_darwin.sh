#!/bin/bash

echo "Install Homebrew for OS X (darwin)"

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Checking for homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found.  Installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed."
  brew update
fi


