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

if [ "$(uname -s)" = "Darwin" ]; then
    # Install xcode
    if type "xcode-select" >/dev/null 2>&1; then
        echo "command line tools already installed"
    else
        xcode-select --install >/dev/null
    fi
    # Install brew (インストール済みならスキップ)
    if [ "$(uname -m)" = "arm64" ]; then
        BREW=/opt/homebrew/bin/brew
    else
        BREW=/usr/local/bin/brew
    fi
    if [ ! -x "$BREW" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$("$BREW" shellenv bash)" >/dev/null
    # Disable auto-capitalization
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    # Disable animation at application launch
    defaults write com.apple.dock launchanim -bool false
    # Display the status bar
    defaults write com.apple.finder ShowStatusBar -bool true
    # Display the path bar
    defaults write com.apple.finder ShowPathbar -bool true
elif [ "$(uname -s)" = "Linux" ]; then
    mkdir -p ~/Downloads
    mkdir -p ~/Documents
    mkdir -p ~/Pictures
    mkdir -p ~/Videos
    mkdir -p ~/Music
    mkdir -p ~/Pictures/screenshots
    mkdir -p ~/Pictures/wallpapers
    for i in "$(pwd)/wallpapers"/??*; do
        cp "$i" "$HOME/Pictures/wallpapers"
    done
fi
