# dotfiles for Ubuntu-i3

## About this repository

<img src="https://assets.ubuntu.com/v1/29985a98-ubuntu-logo32.png" width="100px">

The script `install.sh` builds a i3-wm-based desktop environment on Ubuntu Server 22.04.

## How to use

### 1: Get and install Ubuntu Server 22.04

https://ubuntu.com/download/server

### 2: Run `install.sh` and `dotinstall.sh`

```
git clone https://github.com/omemoji/dotfiles.git
cd dotfiles/ubuntu-i3
sh install.sh
sh dotinstall.sh
```

### 3: Done!🎉

Ubuntu-i3 doesn't have a display manager and a desktop environment starts with `startx` (it automatically starts by .zprofile.)

## Environment

### Applications

| Categories             | Application           |
| ---------------------- | --------------------- |
| Window manager         | i3                    |
| Launcher               | i3-dmenu-desktop      |
| Input method(Japanese) | Fcitx5 and Mozc       |
| Sound                  | PipeWire              |
| Terminal               | rxvt-unicode          |
| Browser                | Google Chrome         |
| Mailer                 | Thunderbird           |
| Editor                 | Visual Studio Code    |
| File manager           | Thunar                |
| Image viewer           | Ristoretto            |
| PDF viewer             | Evince                |
| Media player           | VLC                   |
| Image editor           | GIMP, Inkscape, Krita |

| Categories   | Application(CUI) |
| ------------ | ---------------- |
| Shell        | zsh              |
| Browser      | w3m              |
| Editor       | Vim, Neovim      |
| File Manager | Ranger           |
