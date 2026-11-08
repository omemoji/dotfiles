if [ "$(uname -s)" = "Darwin" ]; then
    # brew bundle (install / dump / cleanup) はどこで実行しても dotfiles の Brewfile を使う。
    # SCRIPT_DIR は .zshrc が設定する ~/.zshrc のリンク先 (dotfiles/.zshrc)
    export HOMEBREW_BUNDLE_FILE="${SCRIPT_DIR:h}/pkg/brew/Brewfile"

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    export PATH="/usr/local/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/usr/local/opt/openjdk/include"

    # zsh プラグインの場所 (zz-plugins.zsh が読み込む。Brewfile で入れる)
    ZSH_PLUGIN_DIR="${HOMEBREW_PREFIX:-/opt/homebrew}/share"

    # ssh-agent: launchd が起動済み。Keychain に保存済みの鍵を読み込む
    # 初回のみ: ssh-add --apple-use-keychain ~/.ssh/signing-key
    ssh-add -l >/dev/null 2>&1 || ssh-add --apple-load-keychain >/dev/null 2>&1
fi
