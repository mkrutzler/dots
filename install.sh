#!/bin/sh
sudo pacman -S --needed --noconfirm git emacs zsh xorg make gcc picom feh xorg-xinit ttf-hack npm ttf-font-awesome xbindkeys neofetch
cd ~/git/dots/dmenu && sudo make clean install && cd ../dwm && sudo make clean install && cd ../st && sudo make clean install && cd ../slstatus && sudo make clean install && cd ../sent && sudo make clean install
cd ~/git/dots && cp -r .local .xbindkeysrc .xinitrc .zshrc .zprofile etc/.vimrc ~/
chmod +x ~/.local/bin/select-wallpaper
chsh -s /bin/zsh
