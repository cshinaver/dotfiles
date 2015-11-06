#!/bin/bash

if ! [[ -d ~/.i3 ]]
then
    mkdir ~/.i3
fi

if ! [[ -e ~/.i3/config ]]
then
    echo "  Symlinking i3 config..."
    ln -s ~/.dotfiles/config/config ~/.i3/config
else
    echo "  i3 config already installed."
fi

