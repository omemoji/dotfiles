SCRIPT_DIR=$(echo $(readlink ~/.zshrc))
for file in $(echo "$SCRIPT_DIR" | sed -e 's/.zshrc//g')/zsh/*.zsh; do
  source "$file"
done
