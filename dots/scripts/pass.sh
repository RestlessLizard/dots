#!/bin/sh

DIR="$PASSWORD_STORE_DIR"

FILES=$(find /home/liz/.local/share/pass -regex '.*\.gpg' | sed 's|/home/liz/.local/share/pass/||' | sed 's|\.gpg||')

SELECTED=$(echo "$FILES" | rofi -dmenu -theme ~/.config/rofi/theme.rasi -p "PASS: ")

[ -n "$SELECTED" ] && pass -c $SELECTED

