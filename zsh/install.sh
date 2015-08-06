#!/bin/bash
#
# Homebrew
#
# This installs oh my zsh

# Check for Homebrew
if ! [[ -d ~/.oh_my_zsh ]]
then
    echo "  Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed."
fi

exit 0
