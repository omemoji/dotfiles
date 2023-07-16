#!/bin/bash
set -eu
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi


brew bundle --verbose


