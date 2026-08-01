export LANG=C.UTF-8

PROMPT='%m:%F{green}%d%f$ '
setopt hist_ignore_dups

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

export EDITOR=vim
bindkey -e

autoload -U compinit promptinit
compinit
promptinit

export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin

#Rust
export RUSTPATH=$HOME/.cargo
export RUSTBIN=$RUSTPATH/bin
export PATH=$PATH:$RUSTBIN

zstyle ':completion:*' menu select

eval "$(starship init zsh)"

eval "$(gh completion -s zsh)"

# mise
eval "$(mise activate zsh)"

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-$HOME/.ssh}/ssh-agent.sock"
ssh-add -l >/dev/null 2>&1
case $? in
  # 2 = エージェントに接続できない -> 起動して鍵を登録
  2) rm -f "$SSH_AUTH_SOCK"
     ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
     ssh-add ~/.ssh/signing-key ;;
  # 1 = エージェントは居るが鍵が無い -> 鍵だけ登録
  1) ssh-add ~/.ssh/signing-key ;;
esac

