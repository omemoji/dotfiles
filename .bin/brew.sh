#!/bin/bash
set -eu
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

brew install python && brew link --overwrite python
brew bundle --verbose