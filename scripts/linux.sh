#!/bin/bash
# ディストリに依存しない Linux のシステム設定 (Void 固有のものは scripts/void.sh)
set -eu
if [ "$(uname -s)" != "Linux" ]; then
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

# brightnessctl (niri の輝度キー) を sudo なしで使うため video グループに入れる。
# brightnessctl の udev ルールが backlight の brightness を video グループ書き込み可にする
# $USER は CI のコンテナなど未設定の環境があり、set -u で落ちるので id -un を使う
sudo usermod -aG video "$(id -un)"

# マシン固有の設定
case "$(./scripts/machine.sh)" in
asahi)
    # Wi-Fi は iwd を NetworkManager のバックエンドとして使う
    sudo mkdir -p /etc/NetworkManager/conf.d
    printf '[device]\nwifi.backend=iwd\n' | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf >/dev/null
    # widevine-installer の gmpwidevine.sh は bash 専用で、greetd (/bin/sh) のログイン時にエラーになるので置き換える
    if [ -f /etc/profile.d/gmpwidevine.sh ]; then
        sudo install -m 644 linux/asahi/profile.d/gmpwidevine.sh /etc/profile.d/gmpwidevine.sh
    fi
    ;;
esac
