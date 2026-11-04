#!/bin/bash
set -eu
if [ "$(uname -s)" = "Linux" ]; then
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
        echo "Services and Daemons - runit"

        SERVICES="NetworkManager bluetoothd dbus elogind chronyd polkitd"

        # マシン固有のサービス
        case "$(./scripts/machine.sh)" in
        asahi)
            # speakersafetyd が無いと内蔵スピーカーが鳴らない (保護のため無効化される)
            # Wi-Fi は iwd を NetworkManager のバックエンドとして使う
            SERVICES="$SERVICES speakersafetyd iwd zramen"
            sudo mkdir -p /etc/NetworkManager/conf.d
            printf '[device]\nwifi.backend=iwd\n' | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf >/dev/null
            ;;
        x86_64)
            SERVICES="$SERVICES tlp"
            ;;
        esac

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

        echo "void-packages"
        if [ ! -d ~/void-packages ]; then
            git clone https://github.com/void-linux/void-packages.git ~/void-packages
        fi
    fi
else
    echo "Your platform is not supported."
    exit 1
fi
