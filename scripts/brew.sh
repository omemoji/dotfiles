#!/bin/bash
set -eu
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

# Brewfile (リポジトリ直下) のパッケージを入れる。python も Brewfile で管理する
brew bundle --file="$(pwd)/Brewfile" --verbose
