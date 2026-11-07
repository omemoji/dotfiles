# Do everything.
all-ja: all Japanese
all: init link install fonts vscode

void-ja: all-ja void-settings
void: all void-settings

# Set initial preference.
init:
	scripts/init.sh

# Link dotfiles.
link:
	scripts/link.sh

# Install applications.
install:
	scripts/install.sh

vscode:
	scripts/vscode.sh

Japanese:
	scripts/japanese.sh

fonts:
	scripts/fonts.sh

void-settings:
	scripts/void.sh