#!/bin/bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade 
brew install git python vim neofetch htop openjdk n translate-shell
brew install --cask google-chrome
brew install --cask google-japanese-ime
brew install --cask yt-music
brew install --cask visual-studio-code
brew install --cask wezterm
brew install --cask zoom
brew install --cask discord
brew install --cask slack
brew install --cask balenaetcher
brew install --cask tiles
brew install --cask microsoft-teams
brew install --cask microsoft-office
brew install --cask vlc

n latest