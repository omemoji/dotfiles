# dotfiles

![macOS](https://github.com/omemoji/dotfiles/actions/workflows/macos.yml/badge.svg) ![Void](https://github.com/omemoji/dotfiles/actions/workflows/void.yml/badge.svg)

## Overview

My dotfiles

## Supported OS

This dotfiles supports Void (Linux) and macOS.

<div style="display:flex;">
<a href="https://voidlinux.org/download/" style="margin-right:10px;" >
<img src="https://voidlinux.org/assets/img/voidlogo.png" alt="Void" height="90"></a>
<a href="https://apple.com/macos" style="">
<img  src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Apple_logo_grey.svg" alt="macOS" height="90"></a>

</div>

## Usage

- Requirements: `make, git, gawk`

```sh

git clone https://github.com/omemoji/dotfiles.git

cd git

# Install all apps and dotfiles
make all
## if you use Linux in Japanese:
make all-ja

# set Void Linux (experimental)
make void
make void-ja

# Install only dotfiles
make link

# (optional) Install flatpak apps
make flatpak


```
