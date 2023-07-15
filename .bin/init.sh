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
    if type "xcode-select" >/dev/null 2>&1; then
        echo "command line tools already installed"
    else
        xcode-select --install >/dev/null
    fi
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
    if [ -e "/etc/default/keyboard" ]; then
        echo "Caps to Ctrl"
        if [[ "$(cat /etc/default/keyboard)" == *XKBOPTIONS* ]]; then
            sudo awk -i inplace '/XKBOPTIONS/{gsub($0,"XKBOPTIONS=\"ctrl:nocaps\"")};{print($0)}' /etc/default/keyboard
        else
            echo "XKBOPTIONS=\"ctrl:nocaps\"" >>/etc/default/keyboard
        fi
    fi
    if [ $(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")="debian" ]; then
        echo "Debian: append software sources"
        sudo awk -i inplace '{if($1 != "#") {gsub("main","main contrib");print($0)} else{print($0)}}' /etc/apt/sources.list
        sudo apt-get update >/dev/null 2>&1
    fi
fi
mkdir ~/.fonts
# Install MesloLGS NF
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts >/dev/null 2>&1
