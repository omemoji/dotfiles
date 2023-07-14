# Do everything.
all: basic optional

all-ja: basic-ja optional

basic: init link install vscode

basic-ja: init link install vscode Japanese

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

# for Japanese:
Japanese:
	.bin/japanese.sh

vscode:
	.bin/vscode.sh