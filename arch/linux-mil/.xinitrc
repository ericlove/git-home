#!/bin/bash

# This is a login shell

# I need to set the DPI before entering awesome, so GUI applications behave.
if [[ "$HOSTNAME" == "eric-hp-mini" ]]
then
    xrandr --dpi 157
    export GDK_SCALE=2
fi

if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

xrdb -merge ~/.Xresources

# There's a bunch of directories that I want to always have 
mkdir -p ~/.local/log/mbacklight/
mkdir -p ~/.local/log/mhng-daemon/
mkdir -p ~/.local/log/mhng-notify/

# The window manager needs to run first, and I pretty much always want
# to run this window manager.
xscreensaver &
exec /usr/bin/awesome

