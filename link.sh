#!/bin/bash
#---create dotfiles link---
set -u

# detect OS
echo "### Detect OS ###"
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
    for conf in "$(pwd)/mac/config"/??*; do
        ln -snfv "$conf" "$HOME/.config"
    done
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

# VSCode
echo "### VSCode ###"
if type "code" >/dev/null 2>&1; then
    echo "VSCode does exists!"
    if [ "$(uname -s)" = "Darwin" ]; then
        VSCODE_SETTING_DIR="$HOME/Library/'Application Support'/Code/User"
        if [ ! -d "$VSCODE_SETTING_DIR" ]; then
            mkdir -pv "$VSCODE_SETTING_DIR"
        fi
        ln -snfv "$(pwd)/mac/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
    elif [ "$(uname -s)" = "Linux" ]; then
        VSCODE_SETTING_DIR="$HOME/.config/Code/User"
        if [ ! -d "$VSCODE_SETTING_DIR" ]; then
            mkdir -pv "$VSCODE_SETTING_DIR"
        fi
        ln -snfv "$(pwd)/linux/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
    fi
    # cat "$(pwd)/pkg/extensions" | while read line; do
    #     code --install-extension $line
    # done
    # code --list-extensions >"$(pwd)/pkg/extensions"
else
    echo "VSCode does NOT exists!"
    exit 1
fi
