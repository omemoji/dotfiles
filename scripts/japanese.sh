#!/bin/bash
#---Input Method---
echo "### Japanese Input Method ###"
sudo apt install fcitx5 fcitx5-mozc
cp -rf $(pwd)/../linux/Japanese/fcitx5 ~/.config/fcitx5

echo "---change caps to ctrl---"
sudo cp keyboard /etc/default/keyboard
sudo systemctl restart console-setup
