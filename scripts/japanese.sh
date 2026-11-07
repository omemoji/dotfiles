#!/bin/bash
#---Input Method---
set -eu
if [ "$(uname -s)" != "Linux" ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 0
fi
if [ "$(./scripts/distro.sh)" = "void" ]; then
    sudo xbps-install -Sy fcitx5 fcitx5-gtk+3 fcitx5-gtk4 fcitx5-configtool
fi
cp -rf "$(pwd)/linux/Japanese/fcitx5" "$HOME/.config/fcitx5"

ln -snfv "$(pwd)/linux/Japanese/fontconfig" "$HOME/.config"
# sudo cp $(pwd)/linux/Japanese/keyboard /etc/default/keyboard
