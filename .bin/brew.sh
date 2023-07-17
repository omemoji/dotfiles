#!/bin/bash
set -eu
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

rm -f '/usr/local/bin/2to3'
brew bundle --verbose


