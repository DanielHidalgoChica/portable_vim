#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Use: $0 <folder_containing_script>"
    exit 1
fi
usb=$1

cp -r "$usb"/.vimrc "$usb"/vim.tgz "$HOME" # Copiamos todo a home

cd "$HOME"
tar zvxf $HOME/vim.tgz # Extraemos todo Vim

# Cambiamos el path para que nos lo encuentre
echo 'PATH=~/vim/usr:$PATH' >> ~/.bash_profile
source ~/.bash_profile

# Switch ctrl y caps
setxkbmap -option ctrl:swapcaps
