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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xbindkeys
unclutter &
redshift -l 51:10 -t 5500:2000 &
# redshift -l 51:10 -t 5500:2000 -b 1:0.35 &
compton -c -r8 -l-12 -t-8  -G  -f -D30 -I0.45 -O0.45  --paint-on-overlay --unredir-if-possible  --backend glx --glx-no-stencil --glx-no-rebind-pixmap &

[[ -x "$(command -v numlockx)" ]] && numlockx

exec i3
