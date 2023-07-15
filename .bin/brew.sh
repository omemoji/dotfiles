#!/bin/bash
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

brew doctor
brew update
brew upgrade

brew bundle --vervose
