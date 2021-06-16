#!/bin/bash

pgrep -x rofi && exit

mounts="$(lsblk -lp | grep "sd" | grep "part" | awk '{print $1" ("$4")"}')"

[ -z "$mounts" ] && exit

selected="$(echo "$mounts" | rofi -dmenu -p "mnt" | awk '{print $1}')"

[ -z "$selected" ] && exit

pass="$(rofi -dmenu -p "sudo")"

echo "$pass"

sudo -S mount "$selected" <<< "$pass" && exit

dirs="$(find /mnt /home -maxdepth 0)"

mountpoint=$(echo "$dirs" | rofi -dmenu)
[ -z "$mountpoint" ] && exit

echo "$pass" | sudo -S mount "$selected" "$mountpoint" && exit
