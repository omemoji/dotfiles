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
    sudo spctl --master-disable
    if type "xcode-select" >/dev/null 2>&1; then
        echo "command line tools already installed"
    else
        xcode-select --install >/dev/null
    fi
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

elif [ "$(uname -s)" = "Linux" ]; then
    mkdir -p ~/Downloads
    mkdir -p ~/Documents
    mkdir -p ~/Pictures
    mkdir -p ~/Videos
    mkdir -p ~/Music
    mkdir -p ~/Pictures/screenshots
    mkdir -p ~/Pictures/wallpapers
    for i in wallpapers/*; do
        cp "$i" ~/Pictures/"$i"
    done
    if [ -e "/etc/default/keyboard" ]; then
        echo "Caps to Ctrl"
        if [[ "$(cat /etc/default/keyboard)" == *XKBOPTIONS* ]]; then
            sudo awk -i inplace '/XKBOPTIONS/{gsub($0,"XKBOPTIONS=\"ctrl:nocaps\"")};{print($0)}' /etc/default/keyboard
        else
            echo "XKBOPTIONS=\"ctrl:nocaps\"" >>/etc/default/keyboard
        fi
    fi
    if [ $(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")="debian" ]; then
        if [ -e "/etc/apt/sources.list" ]; then
            echo "Debian: append software sources"
            sudo awk -i inplace '{if($1 != "#") {gsub("main","main contrib");print($0)} else{print($0)}}' /etc/apt/sources.list
            sudo apt-get update >/dev/null 2>&1
        fi
    fi
fi
mkdir -p ~/.fonts
# Install MesloLGS NF
mkdir -p ~/.fonts/MesloLGS_NF
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts/MesloLGS_NF >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts/MesloLGS_NF >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts/MesloLGS_NF >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts/MesloLGS_NF >/dev/null 2>&1
