#!/bin/bash
#---Input Method---
set -eu
if [ "$(uname -s)" != "Linux" ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 0
fi
if [ $(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")="debian" ]; then
    yes | sudo apt-get install fcitx5 fcitx5-mozc
fi
cp -rf "$(pwd)/linux/Japanese/fcitx5" "$HOME/.config/fcitx5"

ln -snfv "$(pwd)/linux/Japanese/fontconfig" "$HOME/.config"
# sudo cp $(pwd)/linux/Japanese/keyboard /etc/default/keyboard
