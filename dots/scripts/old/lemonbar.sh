#!/bin/bash

BG_S="%{B#444}"
FG_S="%{F#666}"
DROP="%{F-}%{B-}"

out(){
	DESKTOPS="$(echo "${@:2:10}" | sed 's/[ouU]//g')"
	FOCUSED="$(echo "$DESKTOPS" | grep -Eo '[OF][0-9]')"
	EMPTY="$(echo "$DESKTOPS" | grep -Eo 'f[0-9]')"
	for e in $EMPTY
	do
		DESKTOPS=${DESKTOPS//$e/$FG_S${e:1}$DROP}
	done
	DESKTOPS_F=" ${DESKTOPS// / | } "
	DESKTOPS_F="$(echo "$DESKTOPS_F" | sed "s/ $FOCUSED /$BG_S ${FOCUSED:1} $DROP/")"
	echo "$DESKTOPS_F"
}

run(){
	bspc subscribe report | while read line;
	do
		out ${line//:/ }
	done
}

run | lemonbar -f "Hack" -g 400x30+0+0 -B "#222" -F "#FFF"
