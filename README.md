# dotfiles

![macOS](https://github.com/omemoji/dotfiles/actions/workflows/macos.yml/badge.svg) ![Debian](https://github.com/omemoji/dotfiles/actions/workflows/debian.yml/badge.svg)

## Overview

My dotfiles

## Supported OS

This dotfiles supports Debian and macOS.

<div style="display:flex;">
<a href="https://debian.org" style="margin-right:10px;">
<img  src="https://www.debian.org/logos/openlogo-nd.svg" alt="Debian" height="90"></a>
<!-- <a href="https://voidlinux.org">
<img src="https://a-hel-fi.m.voidlinux.org/logos/void-dark2.svg" alt="Void" height="90"></a> -->
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

# Install only dotfiles
make link

# (optional) Install flatpak apps
make flatpak
```

## Applications

### Linux

i3-based desktop environment, which is extremely light and fast

<details>
<summary>Debian</summary>

| Categories              | Application                 |
| ----------------------- | --------------------------- |
| Window manager          | i3                          |
| Launcher                | i3-dmenu-desktop            |
| Input method (Japanese) | Fcitx5 and Mozc             |
| Sound                   | PipeWire                    |
| Terminal                | rxvt-unicode                |
| Browser                 | Google Chrome, Firefox, w3m |
| Mailer                  | Thunderbird                 |
| Editor                  | Visual Studio Code, Vim     |
| File manager            | Thunar, Ranger              |
| Image viewer            | Ristoretto                  |
| PDF viewer              | Evince                      |
| Media player            | VLC                         |
| Image editor            | GIMP, Inkscape, Krita       |

</details>

### macOS

## Optional

### Apt

```
# contrib
translate-shell
```

### Golang

https://go.dev/doc/install

### Rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# restart your current shell
rustup update stable
cargo install cargo-update
```

### OCaml

https://opam.ocaml.org/doc/Install.html

```sh
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
```

<!--
<img width="100%" alt="macOS" src="https://user-images.githubusercontent.com/68148226/218248695-71733a5e-251e-4e4a-a77e-64c46ccd569b.png"> -->
