#!/bin/bash
#---create dotfiles link---
set -eu

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
    mkdir -p "$HOME"/.config
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
    ln -snfv "$(pwd)/$dotfile" "$HOME"
done

echo "### Install common config ###"
for conf in "$(pwd)/config"/??*; do
    ln -snfv "$conf" "$HOME/.config"
done

# config
if [ "$(uname -s)" = "Darwin" ]; then
    echo "### Install config for macOS ###"
    # ダンプして更新出来るようにするため、Brewfileはホームディレクトリに配置
    ln -snfv $(pwd)/Brewfile "$HOME"
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
    # マシン固有の設定 (linux/<machine>/config/<app>/<file>) はファイル単位でリンクする。
    # ~/.config/<app> が共通設定へのリンクの場合、リンクは linux/config/<app>/ 内に作られる
    # (.gitignore で machine.* を除外している)
    MACHINE="$(./scripts/machine.sh)"
    if [ -d "$(pwd)/linux/$MACHINE/config" ]; then
        echo "### Install config for $MACHINE ###"
        (cd "$(pwd)/linux/$MACHINE/config" && find . -type f) | while read -r f; do
            f="${f#./}"
            mkdir -p "$HOME/.config/$(dirname "$f")"
            ln -snfv "$(pwd)/linux/$MACHINE/config/$f" "$HOME/.config/$f"
        done
    fi
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
