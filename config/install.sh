#!/bin/bash

if ! [[ -d ~/.i3 ]]
then
    mkdir ~/.i3
fi

if ! [[ -e ~/.i3/config ]]
then
    ln -s ~/.dotfiles/config/config ~/.i3/config
fi
