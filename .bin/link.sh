#!/bin/bash
#---create dotfiles link---
set -u

# detect OS

if [ "$(uname -s)" = "Darwin" ]; then
    echo "macOS"
elif [ "$(uname -s)" = "Linux" ]; then
    echo "Linux"
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

if [ ! -d "$HOME/.config" ]; then
    mkdir ~/.config
else
    echo "~/.config folder already exists"
fi

# common dotfiles
echo "### Install common dotfiles ###"
for dotfile in .??*; do
    [ "$dotfile" = ".git" ] && continue
    [ "$dotfile" = ".gitignore" ] && continue
    [ "$dotfile" = ".github" ] && continue
    [ "$dotfile" = ".bin" ] && continue
    [ "$dotfile" = ".DS_Store" ] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done

echo "### Install common config ###"
for conf in "$(pwd)/config"/??*; do
    ln -snfv "$conf" "$HOME/.config"
done

# config
if [ "$(uname -s)" = "Darwin" ]; then
    echo "### Install config for macOS ###"
    ln -snfv "$(pwd)/mac/Brewfile" "$HOME"
    # for conf in "$(pwd)/mac/config"/??*; do
    #     ln -snfv "$conf" "$HOME/.config"
    # done
elif [ "$(uname -s)" = "Linux" ]; then
    echo "### Install config for Linux ###"
    for conf in "$(pwd)/linux"/.??*; do
        ln -snfv "$conf" "$HOME"
    done
    for conf in "$(pwd)/linux/config"/??*; do
        ln -snfv "$conf" "$HOME/.config"
    done
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
