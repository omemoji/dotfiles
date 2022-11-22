export LANG=C.UTF-8
PROMPT='%m:%F{green}%d%f$ '
setopt hist_ignore_dups

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

autoload -U compinit promptinit
compinit
promptinit

export GOPATH="$HOME/.go"
export PATH=$PATH:$GOPATH/bin

zstyle ':completion:*' menu select