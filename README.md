# Personal Configuration

your average DWM rice with nvim and zsh configs.

## Features
for the exact patches consult the "patches" file in each suckless software folder

- Dwm: 
    - automatic colorscheme switcher according to your wallpaper (with pywal)
    - wallpaperswitcher script to flawless hotswap wallpapers
    - Volume Button fix for TP X220
    - Caps and Escape swap for convenience in vim

- Nvim
    - Lazy Plugin Manager: lsp, orgmode, telescope, etc...

If you prefer Vim there are some configs under "etc" and they will not be deployed automatically.

- Vim
    - shortcuts for spellchecking
    - word counter function
    - Placeholder "<++>" you can jump to
    - "vimtex" plugin
    - Snippets for:
        - latex
        - html

### Screenshots

Coming soon

# Deployment

## Requirements

I assume you already have a base arch install with wifi ready.

Software required:
- git
- nvim
    - lsp: npm
- zsh
- xorg
    - xinit
- make
- gcc
- picom
- pywal
- shuf
- Hackfont + Font Awesome

## Arch Linux:
It wise to sync pacman first:

```bash
sudo pacman -Sy
```

Then install the requirements:

```bash
sudo pacman -S git neovim zsh xorg make gcc picom feh python-pywal xorg-xinit ttf-hack npm ttf-font-awesome
```

Press enter when prompted, which Xorg and confirm install with "y"

## Installing

Make a "git" folder and clone this repo

```bash
mkdir ~/git && cd git && git clone https://github.com/mkrutzler/dots
```

First run Pywal (compilation of st won't work without it):

```bash
wal -i ~/git/dots/wallpapers/city-panorama.jpg
```

Go into "dots" & compile software:

```bash
cd dots/dmenu && sudo make clean install && cd ../dwm && sudo make clean install && cd ../st && sudo make clean install && cd ../slstatus && sudo make clean install && cd ../sent && sudo make clean install
```

Copy the dotfiles to their places :

:warning: THIS WILL REPLACE EXISTING FILES => BACK UP IF NEEDED :warning:

```bash
cp -r .local .xbindkeysrc .xinitrc .zshrc ~/
```

also apply the nvim config:

```bash
cp -r nvim ~/.config/nvim
```

now change your shell to zsh, log out and log back in:

```bash
chsh -s /bin/zsh
```




Deployment works by copying the files to the exact place. Might make an install/deploy script later
🚧 In construction 🚧

## Credits

- Luke Smith (some of vim config, inspiring me)
- The Primeagen (for nvim config)
- Everyone who helped developing the software 