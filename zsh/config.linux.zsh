if [ "$(uname -s)" = "Linux" ]; then
    # >>> juliaup initialize >>>

    # !! Contents within this block are managed by juliaup !!

    path=("$HOME/.juliaup/bin" $path)
    export PATH

    # <<< juliaup initialize <<<

    [[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null
fi
