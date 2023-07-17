#!/bin/bash
set -eu
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi
sudo rm '/usr/local/bin/2to3'

brew bundle --verbose


