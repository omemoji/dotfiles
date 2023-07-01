#!/bin/sh
#---create dotfiles link---
echo "---create dotfile links---"
mkdir ~/.config
set -u
for dotfile in .??*; do
    [ "$dotfile" = ".git" ] && continue
    rm -r "$HOME/$dotfile"
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done

cd config
for conf in ??*; do
    rm -r "$HOME/.config/$conf"
    ln -snfv "$(pwd)/$conf" "$HOME/.config/$conf"
done
cd ..

chsh -s /usr/bin/zsh
zsh