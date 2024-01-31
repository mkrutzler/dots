#!/bin/sh

echo "Running Install Script, this will log you out in the end"

sudo pacman -S --noconfirm
sudo pacman -S --noconfirm git emacs zsh xorg make gcc picom feh python-pywal xorg-xinit ttf-hack npm ttf-font-awesome xbindkeys
wal -i ~/git/dots/wallpapers/city-panorama.jpg
cd dots/dmenu && sudo make clean install && cd ../dwm && sudo make clean install && cd ../st && sudo make clean install && cd ../slstatus && sudo make clean install && cd ../sent && sudo make clean install
cp -r .local .xbindkeysrc .xinitrc .zshrc .zprofile ~/
chmod +x ~/.local/bin/select_wallpaper
chsh -s /bin/zsh
logout