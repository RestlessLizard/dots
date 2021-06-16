#!/bin/sh

t=$(rofi -dmenu -config ~/.config/rofi/timer.rasi -theme ~/.config/rofi/theme.rasi -p "Time") && 
[ -n "$t" ] && 
m=$(rofi -dmenu -config ~/.config/rofi/timer.rasi -theme ~/.config/rofi/theme.rasi -p "Message") && 
notify-send "Timer started!" "Time: $t" && sleep "$t" && notify-send "TIMER!" "$m" && 
mpv --audio-display=no ~/media/audio/notification.mp3
# Workspace num

