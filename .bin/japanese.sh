#!/bin/bash
#---Input Method---
set -eu
if [ "$(uname -s)" != "Linux" ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 0
fi

yes | sudo apt-get install fcitx5 fcitx5-mozc
cp -rf $(pwd)/linux/Japanese/fcitx5 ~/.config/fcitx5

# sudo cp $(pwd)/linux/Japanese/keyboard /etc/default/keyboard
