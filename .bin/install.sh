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

    if [ "$(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")" = "debian" ]; then
        echo "Debian"
        ./.bin/apt.sh
    elif [ "$(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")" = "void" ]; then
        echo "Void Linux"
        ./.bin/xbps.sh
    fi

elif [ "$(uname -s)" = "Darwin" ]; then
    ./.bin/brew.sh
fi

# Starship
if type "starship" >/dev/null 2>&1; then
    echo "Starship does exists!"
else
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Zsh
if [ "$(uname -s)" = "Linux" ]; then
    echo "Change shell to Zsh"
    chsh -s /usr/bin/zsh
fi
