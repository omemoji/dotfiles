#!/bin/bash
set -u
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
    xcode-select --install >/dev/null

    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

elif [ "$(uname -s)" = "Linux" ]; then
    mkdir ~/Downloads
    mkdir ~/Documents
    mkdir ~/Pictures
    mkdir ~/Videos
    mkdir ~/Music
    mkdir ~/Pictures/screenshots
    mkdir ~/Pictures/wallpapers
    for i in wallpapers/*; do
        cp "$i" ~/Pictures/"$i"
    done
    if [ $(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")="debian" ]; then
        echo "Debian: append software sources"
        cat /etc/apt/sources.list | grep -v ^# | sudo sed -e "/s/main/main contrib non-free/g"
        sudo apt-get update >/dev/null 2>&1
    fi
fi
mkdir ~/.fonts
# Install MesloLGS NF
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts >/dev/null 2>&1
