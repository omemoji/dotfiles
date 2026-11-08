#!/bin/sh
# OS / ディストリビューションの種別を出力する: macos / os-release の ID (void など) / それ以外は uname -s の値
# os-release はシェルの代入文なので、grep で切り出さずに読み込む (ID_LIKE やクォートの有無に影響されない)
set -eu
case "$(uname -s)" in
Darwin)
    echo "macos"
    ;;
Linux)
    for f in /etc/os-release /usr/lib/os-release; do
        if [ -r "$f" ]; then
            (. "$f" && echo "${ID:-linux}")
            exit 0
        fi
    done
    echo "linux"
    ;;
*)
    uname -s
    ;;
esac
