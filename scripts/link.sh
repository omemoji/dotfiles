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
    # ghostty の共通設定から読み込む macOS 専用の設定 (リンクは config/ghostty の中に作られる)
    ln -snfv "$(pwd)/mac/ghostty/config" "$HOME/.config/ghostty/os"
    # Brewfile は pkg/brew/ のものを HOMEBREW_BUNDLE_FILE (zsh/config.macos.zsh) で参照するので、
    # 以前ホームディレクトリに作っていたリンクは消す
    if [ -L "$HOME/Brewfile" ] && [ "$(readlink "$HOME/Brewfile")" = "$(pwd)/Brewfile" ]; then
        rm -v "$HOME/Brewfile"
    fi
    # for conf in "$(pwd)/mac/config"/??*; do
    #     ln -snfv "$conf" "$HOME/.config"
    # done
elif [ "$(uname -s)" = "Linux" ]; then
    echo "### Install config for Linux ###"
    # ghostty の共通設定から読み込む Linux 専用の設定 (リンクは config/ghostty の中に作られる)
    ln -snfv "$(pwd)/linux/ghostty/config" "$HOME/.config/ghostty/os"
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

# yazi のパッケージは config/yazi/package.toml から復元する (.gitignore で本体を除外している)
echo "### Install yazi packages ###"
if command -v ya >/dev/null 2>&1; then
    ya pkg install || echo "ya pkg install failed. Run it again later."
else
    echo "ya command not found. Skip."
fi
