#!/bin/sh

hide (){
	bspc node "$1" -g hidden=on -g marked=on
	tail --pid="$2" -f /dev/null
	bspc node "$1" -g hidden=off -g marked=off
}

bspc subscribe node_add | awk '{ print $5; fflush()}' | while read WID
do
	PID=$(xdo pid $WID)

	NAME=$(ps -hcp "$PID" |  awk '{ print $NF }')
	grep "$NAME" ~/base.txt -q || continue

	PPID=$(ps -o ppid= -p "$PID" | awk '{ print $1 }')

	NAME=$(ps -hcp "$PPID" |  awk '{ print $NF }')
	[ "$NAME" = "bash" ] || continue

	PPID=$(ps -o ppid= -p "$PPID" | awk '{ print $1 }')
	WID=$(xdo id -p "$PPID")
	hide "$WID" "$PID"
done

