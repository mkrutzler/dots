setxkbmap -option caps:swapescape &
xbindkeys &
picom --config ~/.config/picom/picom.conf&
WALLPAPER=~/git/dots/wallpapers/city-panorama.png
wal -i $WALLPAPER&
feh --bg-fill $WALLPAPER&
cp ~/.cache/wal/colors.Xresources ~/.Xresources&
xrdb -merge ~/.Xresources &
slstatus&
exec dwm
