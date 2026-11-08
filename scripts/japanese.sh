#!/bin/bash
#---Input Method---
set -eu
if [ "$(uname -s)" != "Linux" ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 0
fi
if [ "$(./scripts/distro.sh)" = "void" ]; then
    # パッケージは pkg/xbps/japanese/ で管理する (common.txt + マシン固有の <machine>.txt)
    MACHINE="$(./scripts/machine.sh)"
    echo "### Install Japanese input method (common) ###"
    xargs sudo xbps-install -Sy <"$(pwd)/pkg/xbps/japanese/common.txt"
    if [ -f "$(pwd)/pkg/xbps/japanese/${MACHINE}.txt" ]; then
        echo "### Install Japanese input method (${MACHINE}) ###"
        xargs sudo xbps-install -Sy <"$(pwd)/pkg/xbps/japanese/${MACHINE}.txt"
    fi
    # fcitx5-mozc は aarch64 向けの公式パッケージが無い (mozc がクロスビルドできないため) ので、
    # x86_64.txt にだけ入れている。fcitx5 の profile (linux/Japanese/fcitx5) は mozc を使うので、
    # 入っていなければ xbps-src でのビルド手順を案内する
    if ! xbps-query fcitx5-mozc >/dev/null 2>&1; then
        echo "WARNING: fcitx5-mozc is not installed (no official package for $(uname -m))."
        echo "Build it with xbps-src:"
        echo "  git clone https://github.com/void-linux/void-packages.git && cd void-packages"
        echo "  ./xbps-src binary-bootstrap && ./xbps-src pkg mozc"
        echo "  sudo xbps-install -R hostdir/binpkgs fcitx5-mozc"
    fi
fi
cp -rf "$(pwd)/linux/Japanese/fcitx5" "$HOME/.config/fcitx5"

ln -snfv "$(pwd)/linux/Japanese/fontconfig" "$HOME/.config"
# sudo cp $(pwd)/linux/Japanese/keyboard /etc/default/keyboard
