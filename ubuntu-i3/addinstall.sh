#!/bin/bash
#OBS Studio
yes | sudo add-apt-repository ppa:obsproject/obs-studio
yes | sudo apt update
yes | sudo apt install obs-studio

#Go
yes | sudo add-apt-repository ppa:longsleep/golang-backports
yes | sudo apt update
yes | sudo apt install golang-go

#Java
yes | sudo apt install openjdk-19-jdk

#Nodejs
yes | sudo apt install nodejs npm
yes | sudo npm install n -g
yes | sudo n lts
yes | sudo apt purge nodejs npm

#Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update stable
cargo install cargo-update
cargo install bottom --locked

#Flatpak
sudo apt install flatpak
#add repositories 
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update
#Creativity
flatpak install flathub org.blender.Blender
flatpak install flathub org.ardour.Ardour
flatpak install flathub org.kde.krita
#Social
flatpak install flathub com.slack.Slack
flatpak install flathub com.discordapp.Discord
#Game
flatpak install flathub com.valvesoftware.Steam

