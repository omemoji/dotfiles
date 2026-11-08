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
        export XDEB_PKGROOT="$HOME/.config/xdeb"
    fi
    [[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh >/dev/null 2>/dev/null

    # zsh プラグインの場所 (zz-plugins.zsh が読み込む。pkg/xbps/common.txt で入れる)
    ZSH_PLUGIN_DIR=/usr/share/zsh/plugins

    # ssh-agent: gcr-ssh-agent 経由で gnome-keyring にパスフレーズを預ける
    # 鍵は login キーリングから自動でロック解除されるので ssh-add は不要
    # gcr のヘルパーはディストリにより /usr/libexec か /usr/lib にある
    _gcr_libexec=
    for _d in /usr/libexec /usr/lib; do
        if [ -x "$_d/gcr-ssh-agent" ]; then
            _gcr_libexec="$_d"
            break
        fi
    done
    if [ -n "$_gcr_libexec" ]; then
        _gcr_dir="${XDG_RUNTIME_DIR:-$HOME/.cache}/gcr"
        export SSH_AUTH_SOCK="$_gcr_dir/ssh"
        # VSCode は自前の askpass を注入してくるので上書きしておく
        # (SSH_ASKPASS_REQUIRE=never にすると鍵のロック解除経路が塞がれて署名が失敗する)
        export SSH_ASKPASS="$_gcr_libexec/gcr4-ssh-askpass"
        export SSH_ASKPASS_REQUIRE=prefer
        ssh-add -L >/dev/null 2>&1
        if [ $? -eq 2 ]; then
            # エージェントに接続できない -> 起動する (セッション終了時に wayland-session が止める)
            # 鍵の投入は agent 自身の環境で行われるので、ここの env が効く
            mkdir -p "$_gcr_dir"
            rm -f "$SSH_AUTH_SOCK"
            setsid --fork "$_gcr_libexec/gcr-ssh-agent" --base-dir "$_gcr_dir" </dev/null >/dev/null 2>&1
        fi
    fi
    unset _d _gcr_libexec _gcr_dir
fi
