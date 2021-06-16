#!/bin/sh

BG_S="%{B#444}"
FG_S="%{F#666}"
DROP="%{F-}%{B-}"

TILED_C="%{F#40E0D0}T$DROP"
MONO_C="%{F#F94F1C}M$DROP"


getDesktops(){
	FOCUSED=$(bspc query -D -d .focused --names)
	EMPTY=$(bspc query -D -d .!occupied --names | sed "s/^$FOCUSED\$//")

	ALL=$(bspc query -D --names | xargs)

	DESKTOPS=" $(echo "$ALL" | sed 's/ / | /g') " 

	DESKTOPS=$(echo "$DESKTOPS" | sed "s/ $FOCUSED /$BG_S&$DROP/")

	for i in $EMPTY
	do
		DESKTOPS=$(echo "$DESKTOPS" | sed "s/ $i /$FG_S&$DROP/")
	done
	echo "$DESKTOPS"
}

getMonocle(){
	WINDOWS_NUM=$(bspc query -N -n .local.!hidden.!floating.window | wc -l)
	[ $WINDOWS_NUM -lt 2 ] && echo "$MONO_C" && return
	echo "$MONO_C > $WINDOWS_NUM"
}

DESKTOPS=$(getDesktops)
LAYOUT=$(bspc wm -g | grep -Eo ":L[MT]:" | grep -q 'M' && echo 'M' || echo 'T')
[ "$LAYOUT" = "M" ] && LAYOUT="$(getMonocle)" || LAYOUT="$TILED_C"
ACTIVE_WINDOW=$(ps -hcp "$(xdotool getwindowfocus getwindowpid)" |  awk '{ print $NF }')

echo "$DESKTOPS $LAYOUT := [ $ACTIVE_WINDOW ]"
