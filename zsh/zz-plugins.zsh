# zsh プラグイン
# .zshrc は zsh/*.zsh を名前順に読み込むので、このファイルが最後になるよう zz- を付けている。
# zsh-syntax-highlighting は他のウィジェット定義より後に読み込む必要がある。
# プラグインの場所 ZSH_PLUGIN_DIR は OS ごとに config.linux.zsh / config.macos.zsh で設定する
if [ -n "${ZSH_PLUGIN_DIR:-}" ]; then
  # 読み込み順に並べる (zsh-syntax-highlighting を最後に)
  for _zsh_plugin in zsh-autosuggestions zsh-syntax-highlighting; do
    if [ -r "$ZSH_PLUGIN_DIR/$_zsh_plugin/$_zsh_plugin.zsh" ]; then
      source "$ZSH_PLUGIN_DIR/$_zsh_plugin/$_zsh_plugin.zsh"
    fi
  done
  unset _zsh_plugin
fi
unset ZSH_PLUGIN_DIR
