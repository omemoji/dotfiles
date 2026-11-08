#!/bin/bash
# Void 固有のシステム設定 (ディストリに依存しないものは scripts/linux.sh)
set -eu
if [ "$(./scripts/distro.sh)" != "void" ]; then
    echo "Not Void Linux!"
    exit 1
fi

echo "Services and Daemons - runit"

SERVICES="NetworkManager bluetoothd dbus elogind chronyd polkitd avahi-daemon cupsd ufw socklog-unix nanoklogd greetd"

# マシン固有のサービス
case "$(./scripts/machine.sh)" in
asahi)
    # speakersafetyd が無いと内蔵スピーカーが鳴らない (保護のため無効化される)
    # Wi-Fi は iwd を NetworkManager のバックエンドとして使う (NetworkManager の設定は scripts/linux.sh)
    SERVICES="$SERVICES speakersafetyd iwd zramen"
    ;;
x86_64)
    SERVICES="$SERVICES tlp"
    ;;
esac

# 蓋を閉じたときのサスペンドは elogind に任せる (外部モニター接続時も含む)。
# acpid の handler.sh は zzz で直接サスペンドするため elogind を経由せず、
# swayidle の before-sleep (スリープ前の swaylock) が動かない。
# 電源・スリープボタンも elogind が扱うので acpid は無効にする。
sudo mkdir -p /etc/elogind/logind.conf.d
printf '[Login]\nHandleLidSwitch=suspend\nHandleLidSwitchExternalPower=suspend\nHandleLidSwitchDocked=suspend\n' |
    sudo tee /etc/elogind/logind.conf.d/10-lid.conf >/dev/null
sudo rm -fv /etc/runit/runsvdir/default/acpid

# ログインは greetd + tuigreet (config.toml の _greeter は Void のパッケージが作るユーザー)
sudo mkdir -p /etc/greetd
sudo install -m 644 linux/greetd/config.toml /etc/greetd/config.toml
sudo install -m 755 linux/greetd/wayland-session /etc/greetd/wayland-session

# PipeWire は wayland-session が起動し、WirePlumber と pipewire-pulse は PipeWire に起動させる
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -snfv /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -snfv /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

# /var/service は /run/runit/runsvdir/current -> /etc/runit/runsvdir/default を指すので、
# default にリンクすれば稼働中のシステムにも反映される (chroot やコンテナでも動く)。
# /var/service を消して作り直すと agetty などの既存サービスが外れるのでしない。
echo "/etc/runit/runsvdir/default/"
for sv in $SERVICES; do
    if [ -d "/etc/sv/$sv" ]; then
        sudo ln -snfv "/etc/sv/$sv" /etc/runit/runsvdir/default/
    else
        echo "skip: /etc/sv/$sv not found"
    fi
done
ls /etc/runit/runsvdir/default/
