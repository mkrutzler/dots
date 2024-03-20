setxkbmap -layout de -option caps:swapescape &
xbindkeys &
picom&
WALLPAPER=~/git/dots/wallpapers/city-panorama.jpg
#wal -i $WALLPAPER&
feh --bg-fill $WALLPAPER&
#cp ~/.cache/wal/colors.Xresources ~/.Xresources&
#xrdb -merge ~/.Xresources &
amixer sset Master mute
slstatus&
exec dwm
