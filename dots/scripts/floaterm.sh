#!/bin/sh

WID=$(xdo id -n floaterm)

if [ -n "$WID" ]
then
	if [ -n "$(bspc query -N -n "$WID.hidden")" ]
	then
		bspc node "$WID" -g hidden=off -f
	else
		bspc node "$WID" -g hidden=on 
	fi
else
	#alacritty --class floaterm,floaterm -e tmux start\; new-session nvim -c VimwikiIndex & exit
	alacritty --class floaterm,floaterm & exit
fi

