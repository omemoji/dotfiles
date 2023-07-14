#!/bin/bash
#---Input Method---

if [ "$(uname -s)" != "Linux" ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

sudo apt-get install fcitx5 fcitx5-mozc
cp -rf $(pwd)/linux/Japanese/fcitx5 ~/.config/fcitx5

sudo cp keyboard /etc/default/keyboard
