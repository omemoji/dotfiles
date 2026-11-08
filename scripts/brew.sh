#!/bin/bash
set -eu
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

# pkg/brew/Brewfile のパッケージを入れる。
brew bundle --file="$(pwd)/pkg/brew/Brewfile" --verbose
