export LANG=en_US.UTF-8

PROMPT='%m:%F{green}%d%f$ '
setopt hist_ignore_dups

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

export EDITOR=nvim
bindkey -e

autoload -U compinit promptinit
compinit
promptinit

#export TERM=rxvt-unicode
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.local/bin

#Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

#n
export N_PREFIX=$HOME/.local/n
export PATH=$N_PREFIX/bin:$PATH

#Rust
export RUSTPATH=$HOME/.cargo
export RUSTBIN=$RUSTPATH/bin
export PATH=$PATH:$RUSTBIN

#Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

zstyle ':completion:*' menu select

eval "$(starship init zsh)"

eval "$(gh completion -s zsh)"

. "$HOME/.asdf/asdf.sh"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
