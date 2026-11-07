#!/bin/bash
set -eu
if [ "$(uname -s)" = "Darwin" ]; then
    echo 'macOS'
elif [ "$(uname -s)" = "Linux" ]; then
    echo 'Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

if [ "$(uname -s)" = "Linux" ]; then
    if [ "$(./scripts/distro.sh)" = "void" ]; then
        echo "Void Linux"
        ./scripts/xbps.sh
    fi
elif [ "$(uname -s)" = "Darwin" ]; then
    ./scripts/brew.sh
fi

# mise (node/go/bun/pnpm; Mason の npm 系 LSP もこの node を使う)
if [ -x "$HOME/.local/bin/mise" ]; then
    echo "mise does exists!"
else
    curl https://mise.run | sh
fi
"$HOME/.local/bin/mise" install

# Zsh
if [ "$(uname -s)" = "Linux" ]; then
    echo "Change shell to Zsh"
    chsh -s /usr/bin/zsh
fi
