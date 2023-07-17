set -eu

if [ "$(uname -s)" = "Linux" ]; then
    mkdir -p ~/.fonts
    FONTS_DIR="$HOME/.fonts"
elif [ "$(uname -s)" = "Darwin" ]; then
    FONTS_DIR="$HOME/Library/Fonts"
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

# Install MesloLGS NF
mkdir -p "$FONTS_DIR/MesloLGS_NF"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P "$FONTS_DIR/MesloLGS_NF" >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P "$FONTS_DIR/MesloLGS_NF" >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P "$FONTS_DIR/MesloLGS_NF" >/dev/null 2>&1
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P "$FONTS_DIR/MesloLGS_NF" >/dev/null 2>&1

CICA_RELEASES_URL="https://api.github.com/repos/miiton/Cica/releases"
curl -sfL "${CICA_RELEASES_URL}" | jq -r '.[0].assets | .[].browser_download_url' | grep -i without_emoji.zip | xargs -I{} curl -fL -o ~/Cica.zip "{}"
(cd ~/ && unzip -o Cica.zip -d "$FONTS_DIR/cica")

rm -f ~/Cica.zip