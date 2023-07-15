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
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/sbin

#Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

#n
export N_PREFIX=$HOME/local/n
export PATH=$N_PREFIX/bin:$PATH

#Rust
export RUSTPATH=$HOME/.cargo
export RUSTBIN=$RUSTPATH/bin
export PATH=$PATH:$RUSTBIN

[[ ! -r /home/omemoji/.opam/opam-init/init.zsh ]] || source /home/omemoji/.opam/opam-init/init.zsh >/dev/null 2>/dev/null

zstyle ':completion:*' menu select

eval "$(starship init zsh)"
