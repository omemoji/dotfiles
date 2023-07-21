# dotfiles

![Debian](https://github.com/omemoji/dotfiles/actions/workflows/debian.yml/badge.svg) ![macOS](https://github.com/omemoji/dotfiles/actions/workflows/macos.yml/badge.svg) 

## Overview

My dotfiles

## Supported OS

This dotfiles supports Debian, Void (Linux) and macOS.

<div style="display:flex;">
<a href="https://debian.org/download" style="margin-right:10px;">
<img  src="https://www.debian.org/logos/openlogo-nd.svg" alt="Debian" height="90"></a>
<a href="https://voidlinux.org/download/">
<img src="https://a-hel-fi.m.voidlinux.org/logos/void-dark2.svg" alt="Void" height="90"></a>
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

### Golang

https://go.dev/doc/install

### Rust

https://www.rust-lang.org/tools/install

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# restart your current shell
rustup update stable
cargo install cargo-update
```

### Docker

https://docs.docker.com/engine/install/debian/


```sh
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

```

### OCaml

https://opam.ocaml.org/doc/Install.html

```sh
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
```

<!--
<img width="100%" alt="macOS" src="https://user-images.githubusercontent.com/68148226/218248695-71733a5e-251e-4e4a-a77e-64c46ccd569b.png"> -->
