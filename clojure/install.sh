#!/bin/bash

# Check for .lein
if ! [[ -d ~/.lein ]]
then
    mkdir ~/.lein
fi

DEST=~/.lein SRC=~/.dotfiles/clojure/profiles.clj
if ! [ -f ~/.lein/profiles.clj ]
then
    echo "  Symlinking Clojure Leningen profiles.clj..."
    ln -s $SRC $DEST
else
    echo "  Clojure Leningen profiles.clj already exists."
fi
