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

# mise (node/go/bun/pnpm; Mason の npm 系 LSP もこの node を使う)
if [ "$(uname -s)" = "Linux" ]; then
    # 公式手順 (https://mise.jdx.dev/installing-mise.html) で ~/.local/bin/mise に入れる。
    # パッケージマネージャ経由ではないので self_update.auto で自動更新できる
    if [ -x "$HOME/.local/bin/mise" ]; then
        echo "mise does exists!"
    else
        curl https://mise.run | sh
    fi
    "$HOME/.local/bin/mise" install
elif [ "$(uname -s)" = "Darwin" ]; then
    # macOS は Brewfile で入れる
    mise install
fi

# Zsh
if [ "$(uname -s)" = "Linux" ]; then
    echo "Change shell to Zsh"
    chsh -s /usr/bin/zsh
fi
