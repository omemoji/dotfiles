#!/bin/bash

#Advanced

##Nodejs
yes | sudo apt install nodejs npm
yes | sudo npm install n -g
yes | sudo n lts
yes | sudo apt purge nodejs npm

##Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update stable
cargo install cargo-update
cargo install bottom --locked

##Starship
curl -sS https://starship.rs/install.sh | sh