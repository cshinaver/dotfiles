#!/bin/bash

if ! [[ -d ~/.i3 ]]
then
    mkdir ~/.i3
fi

ln -s ~/.dotfiles/config/config ~/.i3/config
