#!/bin/sh

out(){
	OUT=$(amixer sget Master)
	VOLUME=$(echo "$OUT" | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")
	[ -n "$(echo "$OUT" | grep -Eo '\[on\]')" ]  && echo "$VOLUME" || echo "$VOLUME!"
}

killall pact;

out
pactl subscribe | grep --line-buffered remove | while read line
do
	out
done

