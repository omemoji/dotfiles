#!/bin/bash
# マシン種別を出力する: asahi / x86_64 / それ以外は uname -m の値
set -eu
if [ "$(uname -m)" = "aarch64" ] && grep -qs "apple" /proc/device-tree/compatible; then
    echo "asahi"
else
    uname -m
fi
