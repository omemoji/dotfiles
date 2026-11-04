export LANG=C.UTF-8

PROMPT='%m:%F{green}%d%f$ '
setopt hist_ignore_dups
setopt interactivecomments

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
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
  # VSCode は自前の askpass を注入してくるので上書きしておく
  # (SSH_ASKPASS_REQUIRE=never にすると鍵のロック解除経路が塞がれて署名が失敗する)
  export SSH_ASKPASS=/usr/libexec/gcr4-ssh-askpass
  export SSH_ASKPASS_REQUIRE=prefer
  ssh-add -L >/dev/null 2>&1
  if [ $? -eq 2 ]; then
    # エージェントに接続できない -> 起動する
    # 鍵の投入は agent 自身の環境で行われるので、ここの env が効く
    mkdir -p "$_gcr_dir"
    rm -f "$SSH_AUTH_SOCK"
    setsid --fork /usr/libexec/gcr-ssh-agent --base-dir "$_gcr_dir" </dev/null >/dev/null 2>&1
  fi
  unset _gcr_dir
fi

