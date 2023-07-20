#!/bin/bash
set -eu
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
    # Install extensions
    # cat "$(pwd)/pkg/extensions" | while read line; do
    #     code --install-extension $line
    # done
else
    echo "VSCode does NOT exists!"
    exit 0
fi
