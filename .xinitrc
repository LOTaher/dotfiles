#!/bin/bash

setxkbmap -option "ctrl:nocaps"
sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &
~/.fehbg &
picom & # compositer for transparency
dwmbar &
dunst & # desktop notifications
lowbatd 15 &
exec dwm
