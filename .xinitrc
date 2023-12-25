setxkbmap -option caps:swapescape &
xbindkeys &
picom --config ~/.config/picom/picom.conf&
WALLPAPER = $(ls ~/Wallpapers | shuf -n 1)&
wal -i ~/Wallpapers/$WALLPAPER&
cp ~/.cache/wal/colors.Xresources ~/.Xresources&
xrdb -merge ~/.Xresources &
slstatus&
exec dwm
