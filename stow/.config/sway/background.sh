#!/bin/sh

if [ -z ${WALLPAPER_DIR+x} ]; then
    source $HOME/.zshenv
fi

swaybg -i "$WALLPAPER_DIR/$(ls $WALLPAPER_DIR | shuf -n1)" -m fill &
OLD_PID=$!

while true; do
    sleep 3600 # change every hour
    swaybg -i "$WALLPAPER_DIR/$(ls $WALLPAPER_DIR | shuf -n1)" -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
