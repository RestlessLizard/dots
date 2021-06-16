#!/bin/sh

TEMP_FILE="$HOME/.num.count"

#trap "rm $TEMP_FILE; exit" SIGHUP SIGINT SIGTERM
#trap update SIGUSR1
#trap reset SIGUSR2

update(){
	NUM=$(cat "$TEMP_FILE" | sed "1d")
	NUM=$(( $NUM + 1 ))
	sed -i "2s/.*/$NUM/" "$TEMP_FILE"
}


reset(){
	sed -i "2s/.*/0/" "$TEMP_FILE"
}

start(){
	[ -f "$TEMP_FILE" ] && sed -i "1s/.*/$$/" "$TEMP_FILE" ||
		echo "$$\n0" > "$TEMP_FILE"
	ls "$TEMP_FILE" | entr sed "1d" "$TEMP_FILE"
}


"$@"
