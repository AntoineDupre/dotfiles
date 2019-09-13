#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

twm &
xclock -geometry 50x50-1+1 &




xset s off
xset -dpms
xset s noblank

xset r rate 200 20

setxkbmap fr
setxkbmap -option ctrl:nocaps
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Hyper_L'
xrandr --output DP-5 --rotate left
xrandr --output DP-3 --rotate left
xrandr --output DP-3 --mode 1920x1200
xrandr --output DP-4 --mode 3440x1440
xrandr --output DP-5 --mode 1920x1200
xrandr --output DP-4 --right-of DP-3
xrandr --output DP-5 --right-of DP-4
# xrandr --output DP-4 --pos 1200x450
# xrandr --output DP-5 --pos 4640x100

# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
## exec xterm -geometry 80x66+0+0 -name login
exec i3
# exec dwm
