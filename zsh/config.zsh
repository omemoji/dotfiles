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

# ssh-agent: OS のキーリングにパスフレーズを預ける
if [ "$(uname -s)" = "Darwin" ]; then
  # launchd が ssh-agent を起動済み。Keychain 保存済みの鍵を読み込む
  # 初回のみ: ssh-add --apple-use-keychain ~/.ssh/signing-key
  ssh-add -l >/dev/null 2>&1 || ssh-add --apple-load-keychain >/dev/null 2>&1
else
  # gcr-ssh-agent 経由で gnome-keyring に預ける
  # 鍵は login キーリングから自動でロック解除されるので ssh-add は不要
  _gcr_dir="${XDG_RUNTIME_DIR:-$HOME/.cache}/gcr"
  export SSH_AUTH_SOCK="$_gcr_dir/ssh"
  export SSH_ASKPASS=/usr/libexec/gcr4-ssh-askpass
  export SSH_ASKPASS_REQUIRE=prefer
  ssh-add -l >/dev/null 2>&1
  if [ $? -eq 2 ]; then
    # エージェントに接続できない -> 起動する
    mkdir -p "$_gcr_dir"
    rm -f "$SSH_AUTH_SOCK"
    setsid /usr/libexec/gcr-ssh-agent --base-dir "$_gcr_dir" >/dev/null 2>&1 &!
  fi
  unset _gcr_dir
fi

