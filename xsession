# use UTF-8 everywhere
export LANG=en_US.UTF-8

# specify location of kshrc
export ENV=$HOME/.kshrc

# load Xresources file
xrdb -merge $HOME/.Xresources

# set your background color
hsetroot -fill ~/Pictures/openbsd_wallpaper_1.jpg

# xidle will lock your display after a period of inactivity
xidle &

# sadly, xclock has a bug where the font selection is ignored when UTF-8
# is enabled, so we unset LANG here.
# LANG= xclock -strftime "%a %e %b %Y %H:%M" &

# disable system beep
xset b off

# if you have a ThinkPad, the following lines enable TrackPoint
# scrolling by dragging with the middle button.
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1 
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2 
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5 

# swap caps and esc
setxkbmap -option caps:swapescape

# start lemonbar
$HOME/scripts/lemonbar-launch.sh

# start cwm!
exec cwm



