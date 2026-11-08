export LANG=C.UTF-8

PROMPT='%m:%F{green}%d%f$ '
setopt hist_ignore_dups
setopt interactivecomments
# 履歴を即時に書き出し、他のターミナルとも共有する (zsh-autosuggestions の候補にも反映される)
setopt share_history

export HISTFILE=~/.zsh_history
# メモリ上の履歴 (HISTSIZE) が SAVEHIST より小さいと、保存されるのも HISTSIZE 件までになる
export HISTSIZE=10000
export SAVEHIST=10000

if type nvim >/dev/null 2>&1; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
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


