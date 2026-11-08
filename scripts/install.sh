#!/bin/bash
set -eu
DISTRO="$(./scripts/distro.sh)"
case "$DISTRO" in
macos)
    ./scripts/brew.sh
    ;;
void)
    ./scripts/xbps.sh
    ;;
*)
    echo "Your platform ($DISTRO) is not supported."
    exit 1
    ;;
esac

# mise (node/go/bun/pnpm; Mason の npm 系 LSP もこの node を使う)
if [ -x "$HOME/.local/bin/mise" ]; then
    echo "mise does exists!"
else
    curl https://mise.run | sh
fi
"$HOME/.local/bin/mise" install

# Zsh (macOS は既定で zsh)
if [ "$DISTRO" != "macos" ]; then
    echo "Change shell to Zsh"
    chsh -s /usr/bin/zsh
fi
