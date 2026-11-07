if [ "$(uname -s)" = "Linux" ]; then
    export PATH=$PATH:/usr/share/code/bin
    export PATH=$PATH:$HOME/dotfiles/.bin
    export PATH=$PATH:$HOME/.AppImage
    export WINEPREFIX=~/.wine
    export WINEARCH="win32"

    # SCRIPT_DIR は .zshrc が設定する ~/.zshrc のリンク先 (dotfiles/.zshrc)
    if [ "$("${SCRIPT_DIR:h}/scripts/distro.sh")" = "void" ]; then
        # xdeb
        export XDEB_OPT_DEPS=true
        export XDEB_OPT_SYNC=true
        export XDEB_OPT_INSTALL=true
        export XDEB_OPT_FIX_CONFLICT=true
        export XDEB_OPT_WARN_CONFLICT=true

    fi
    [[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null
fi
