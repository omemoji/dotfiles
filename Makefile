# Do everything.
all-ja: all Japanese

all: init link install fonts vscode

# Set initial preference.
init:
	.bin/init.sh

# Link dotfiles.
link:
	.bin/link.sh

# Install applications.
install:
	.bin/install.sh

# Install additional applications.
optional:
	.bin/optional.sh

vscode:
	.bin/vscode.sh

Japanese:
	.bin/japanese.sh

flatpak:
	.bin/flatpak.sh
fonts:
	.bin/fonts.sh