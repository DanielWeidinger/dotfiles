#!/bin/sh

if [ -z ${WALLPAPER_DIR+x} ]; then
	source $HOME/.zshenv
fi
function change_wp() {
	swaybg -i "$(ls $WALLPAPER_DIR/*.jpg | shuf -n1)" -m fill &
}

OLD_PID=$!
change_wp

while true; do
	sleep 3600 # change every hour
    change_wp
	NEXT_PID=$!
	sleep 5
	kill $OLD_PID
	OLD_PID=$NEXT_PID
done
