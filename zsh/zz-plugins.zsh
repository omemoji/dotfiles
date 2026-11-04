# zsh プラグイン
# .zshrc は zsh/*.zsh を名前順に読み込むので、このファイルが最後になるよう zz- を付けている。
# zsh-syntax-highlighting は他のウィジェット定義より後に読み込む必要がある。
if [ "$(uname -s)" = "Darwin" ]; then
  _zsh_plugin_dir="${HOMEBREW_PREFIX:-/opt/homebrew}/share"  # Brewfile
else
  _zsh_plugin_dir=/usr/share/zsh/plugins                     # pkg/xbps/common.txt
fi

# 読み込み順に並べる (zsh-syntax-highlighting を最後に)
for _zsh_plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  if [ -r "$_zsh_plugin_dir/$_zsh_plugin/$_zsh_plugin.zsh" ]; then
    source "$_zsh_plugin_dir/$_zsh_plugin/$_zsh_plugin.zsh"
  fi
done
unset _zsh_plugin _zsh_plugin_dir
