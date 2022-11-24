#!/bin/bash
###VSCode setting
echo "---set Visual Studio Code---"
mkdir -p ~/.config/Code/User
VSCODE_SETTING_DIR=~/.config/Code/User
rm "$VSCODE_SETTING_DIR/settings.json"
ln -snfv "$(pwd)/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
cat "$(pwd)/vscode/extensions" | while read line
do
 code --install-extension $line
done
code --list-extensions > "$(pwd)/vscode/extensions"
echo "---set Visual Studio Code completed---"