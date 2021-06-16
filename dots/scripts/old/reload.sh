#!/bin/sh

#killall -q picom; i3-msg 'exec --no-startup-id "picom --config ~/.config/picom/config --experimental-backend --no-fading-openclose"'
#killall -q picom;
i3-msg 'exec --no-startup-id "picom --config ~/.config/picom/config --experimental-backend"'
#killall -q dunst;
i3-msg 'exec --no-startup-id "dunst"'
#i3-msg exec killall -q redshift
