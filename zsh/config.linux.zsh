if [ "$(uname -s)" = "Linux" ]; then

    # >>> aliases >>>

    # <<< aliases <<<

    # >>> juliaup initialize >>>

    # !! Contents within this block are managed by juliaup !!

    path=("$HOME/.juliaup/bin" $path)
    export PATH

    # <<< juliaup initialize <<<

    export PATH=$PATH:/usr/share/code/bin
    export PATH=$PATH:$HOME/dotfiles/.bin
    export PATH=$PATH:$HOME/.AppImage

    WINEPREFIX=~/.new32prefix WINEARCH="win32"

    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
        # xdeb
        export XDEB_OPT_DEPS=true
        export XDEB_OPT_SYNC=true
        export XDEB_OPT_INSTALL=true
        export XDEB_OPT_FIX_CONFLICT=true
        export XDEB_OPT_WARN_CONFLICT=true

    fi

    [[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null
fi
