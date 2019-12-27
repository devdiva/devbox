#!/bin/bash

script_dir="$(dirname "$0")"

echo $script_dir

print_help()
{
  echo "Usage: install.sh -p <purpose tags string> -c <config tags string>"
  echo " -p Purpose descriptors, e.g. 'fun work'"
  echo " -c Config descriptors, e.g. 'devdiva oss'"
  exit 1
}

while getopts "p:c:" opt; do
  case "$opt" in
    p ) 
       props="$OPTARG" ;;
    c ) 
       confs="$OPTARG" ;;
    \? ) 
        print_help ;;
  esac
done

if [[ -z $confs || -z $props ]]
then
  echo "Invalid arguments"
  print_help
else
  echo "Prepping install:"
  echo "  Props:"
  for val in ${props[@]}; do
    echo "    $val"
  done

  echo "  Configs:"
  for val in ${confs[@]}; do
    echo "    $val"
  done
fi

# TODO - Start stuff to refactor to separate scripts

# 1. OS Bootstrap

if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$script_dir/install_os_darwin.sh"
  
  if [[ "$OSTYPE" == "darwin19"* ]]; then
    source "$script_dir/install_os_darwin19.sh"
  fi
 
  source "$script_dir/install_brew_darwin.sh"
  
fi

# 2. User + Props + OS Config
if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$script_dir/install_dotfiles_darwin.sh"
fi

# 3. Workspace + Props + OS Config
