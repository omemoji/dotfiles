# dotfiles for Ubuntu-i3

<img src="https://raw.githubusercontent.com/omemoji/ubuntu-i3/main/sample.png" width="100%">

## Usage

1. [Get and install Ubuntu Server on your computer](https://ubuntu.com/download/server)


2. Run `install.sh` and `dotinstall.sh`

```
git clone https://github.com/omemoji/dotfiles.git
cd dotfiles/ubuntu-i3
sh install.sh
sh dotinstall.sh
```

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

### .deb package

```
#Coogle Earth
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb -O ~/google-earth.deb
yes | sudo apt update
yes | sudo apt install ~/google-earth.deb
rm ~/google-earth.deb

#OBS Studio
yes | sudo add-apt-repository ppa:obsproject/obs-studio
yes | sudo apt update
yes | sudo apt install obs-studio
```

### Development

```
#virtual machine
yes | sudo apt install qemu-system libvirt-clients libvirt-daemon-system

#Go
yes | sudo add-apt-repository ppa:longsleep/golang-backports
yes | sudo apt update
yes | sudo apt install golang-go

#Java
yes | sudo apt install openjdk-19-jdk

#Nodejs
yes | sudo apt install nodejs npm
yes | sudo npm install n -g
yes | sudo n lts
yes | sudo apt purge nodejs npm
```

### Flatpak

```
#Flatpak
sudo apt install flatpak

#add repositories 
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update

#Creativity
flatpak install flathub org.blender.Blender
flatpak install flathub org.ardour.Ardour
flatpak install flathub org.kde.krita

#Social
flatpak install flathub com.slack.Slack
flatpak install flathub com.discordapp.Discord

#Game
flatpak install flathub com.valvesoftware.Steam
```