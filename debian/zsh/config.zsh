export LANG=C.UTF-8
PROMPT='%m:%F{green}%d%f$ '
setopt hist_ignore_dups

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

autoload -U compinit promptinit
compinit
promptinit
#export TERM=rxvt-unicode
#Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN


#Rust
export RUSTPATH=$HOME/.cargo
export RUSTBIN=$RUSTPATH/bin
export PATH=$PATH:$RUSTBIN


zstyle ':completion:*' menu select

eval "$(starship init zsh)"
