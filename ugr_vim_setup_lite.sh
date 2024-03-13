#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Use: $0 <folder_containing_script>"
    exit 1
fi
usb=$1

cp -r "$usb"/.vim "$usb"/.vimrc "$usb"/vim.tgz "$HOME" # Copiamos todo a home

cd "$HOME"
tar zvxf $HOME/vim.tgz # Extraemos todo Vim

# Cambiamos el path para que nos lo encuentre
echo 'PATH=~/vim/usr:$PATH' >> ~/.bash_profile
source ~/.bash_profile

# Switch ctrl y caps
setxkbmap -option ctrl:swapcaps

proxy=$http_proxy
sproxy=$https_proxy

if [[ -z "$proxy" || -z "$sproxy" ]]; then
    echo "http_proxy env. variable is not set"
        exit 1
fi

git config --global http.proxy "$proxy"
git config --global https.proxy "$sproxy"

