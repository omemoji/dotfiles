# Do everything.
all: init link install vscode

all-ja: init link install vscode Japanese

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