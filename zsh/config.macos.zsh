if [ "$(uname -s)" = "Darwin" ]; then
    # brew bundle (install / dump / cleanup) はどこで実行しても dotfiles の Brewfile を使う。
    # SCRIPT_DIR は .zshrc が設定する ~/.zshrc のリンク先 (dotfiles/.zshrc)
    export HOMEBREW_BUNDLE_FILE="${SCRIPT_DIR:h}/Brewfile"

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
fi
