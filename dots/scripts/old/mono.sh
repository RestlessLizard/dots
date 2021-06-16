#!/bin/sh

hide(){
	[ -n "$(bspc query -N -n .focused.floating)" ] && return
	NODES=$(bspc query -N -n .!focused.local.window.!floating)
	for node in $NODES
	do
		bspc node "$node" -g hidden=on
	done
}

show(){
	NODES=$(bspc query -N -n .hidden.local.!marked.window)
	for node in $NODES
	do
		bspc node "$node" -g hidden=off
	done
}

showNext(){
	[ -n "$(bspc query -N -n .focused.!floating)" ] && return
	[ "$(bspc wm -g | sed 's/:/ /g' | awk '{ print $12 }')" != "LM" ] && return

	bspc node any.local.hidden.!marked.window -g hidden=off -f
}

update(){
	[ "$(bspc query -N -n .local.window.!floating | wc -l)" -gt 1 ] || (bspc desktop -l tiled && return)
	#[ -n "$(bspc query -N -n .focused.floating)" ] && return
	LAYOUT=$(bspc wm -g | awk -F ':' '{ print $12 }')
	showNext
	([ "$LAYOUT" = "LM" ] && hide) || show
}

watch(){
	bspc subscribe node_remove node_add | while read line
	do
		update
	done
}

"$@"

