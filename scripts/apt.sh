#!/bin/bash
set -eu
echo "### Install Debian apps ###"
yes | sudo apt-get update
yes | sudo apt-get upgrade
cat "$(pwd)/pkg/apt.txt" | xargs sudo apt-get -y install

echo "### Install Google Chrome ###"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/google-chrome.deb >/dev/null 2>&1
yes | sudo apt-get update
yes | sudo apt-get install ~/google-chrome.deb
rm ~/google-chrome.deb

echo "### Install Visual Studio Code ###"

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O ~/vscode.deb >/dev/null 2>&1
# yes | curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
# sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# rm -f packages.microsoft.gpg
yes | sudo apt-get update
yes | sudo apt-get install ~/vscode.deb
rm ~/vscode.deb

echo "### Install Wezterm ###"

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
yes | sudo apt-get update
yes | sudo apt-get install wezterm

yes | sudo apt-get autoclean
echo "### Debian apps installed ###"
