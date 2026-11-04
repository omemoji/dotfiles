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
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
        echo "Void Linux"
        ./scripts/xbps.sh
    fi
elif [ "$(uname -s)" = "Darwin" ]; then
    ./scripts/brew.sh
fi

# Starship
if type "starship" >/dev/null 2>&1; then
    echo "Starship does exists!"
else
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# mise (node/go/bun/pnpm; Mason の npm 系 LSP もこの node を使う)
if type "mise" >/dev/null 2>&1 || [ -x "$HOME/.local/bin/mise" ]; then
    echo "mise does exists!"
else
    curl -fsSL https://mise.run | sh
fi
"$HOME/.local/bin/mise" install || mise install

# Zsh
if [ "$(uname -s)" = "Linux" ]; then
    echo "Change shell to Zsh"
    chsh -s /usr/bin/zsh
fi
