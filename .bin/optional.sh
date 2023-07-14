#!/bin/bash
set -u
if [ "$(uname -s)" = "Darwin" ]; then
    OS='macOS'
elif [ "$(uname -s)" = "Linux" ]; then
    OS='Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

if [ OS="Linux" ]; then
    ./.bin/flatpak.sh
elif [ OS="macOS" ]; then
    # Disable auto-capitalization
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    # Disable animation at application launch
    defaults write com.apple.dock launchanim -bool false
    # Display the status bar
    defaults write com.apple.finder ShowStatusBar -bool true
    # Display the path bar
    defaults write com.apple.finder ShowPathbar -bool true
fi

##Rust
if type "rustup" >/dev/null 2>&1; then
    echo "Rust does exists!"
else
    echo "### Install Rust ###"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup update stable
    cargo install cargo-update
fi
