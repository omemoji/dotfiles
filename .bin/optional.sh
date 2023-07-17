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

echo "Install VSCode extentions"
cat "$(pwd)/pkg/extensions" | while read line; do
    code --install-extension $line
done

if [ "$(uname -s)" = "Linux" ]; then
    if [ $(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")="debian" ]; then
        echo "Add some apt packages"
        # contrib
        yes | sudo apt-get install translate-shell

        # Node
        yes | sudo apt-get install nodejs npm
        yes | sudo npm install n -g
        yes | sudo apt-get remove --purge nodejs npm
        yes | sudo apt-get autoremove

        # Google Earth
        wget https://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb -O ~/google-earth.deb
        yes | sudo apt-get update
        yes | sudo apt-get install ~/google-earth.deb
        yes | sudo apt-get upgrade
        rm ~/google-earth.deb
    fi
    ./.bin/flatpak.sh
    git update-index --skip-worktree "$(pwd)/linux/.Xresources"
elif [ "$(uname -s)" = "Darwin" ]; then
    # Disable auto-capitalization
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    # Disable animation at application launch
    defaults write com.apple.dock launchanim -bool false
    # Display the status bar
    defaults write com.apple.finder ShowStatusBar -bool true
    # Display the path bar
    defaults write com.apple.finder ShowPathbar -bool true

    # mas
    

    # LINE
    mas install 539883307
    # Keynote
    mas install 409183694
    # GarageBand
    mas install 682658836
fi
