#!/bin/sh
# Linux のセッションは greetd (tuigreet) から起動する (linux/greetd/ 参照)
if [ "$(uname -s)" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi
