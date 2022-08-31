#!/bin/bash

N_DISPLAYS=$(swaymsg -t get_outputs | jq length)
DELAY=1
if [ $N_DISPLAYS -eq 3 ]; then
    if [ $(date +%H) -gt 19 ]; then
        swaymsg 'workspace 2; exec $browser --new-window'
    else
        swaymsg 'workspace 1; exec $browser --new-window'
        sleep $DELAY
        swaymsg 'workspace 3; exec $browser --new-window'
        sleep $DELAY
        swaymsg 'workspace 9; exec $browser pcode-at.slack.com/ https://mail.google.com/ https://app.tmetric.com/ --new-window'
        sleep $DELAY
        swaymsg 'workspace 3'
        swaymsg 'workspace 2; exec $term'
        sleep $DELAY
    fi
else
    swaymsg 'workspace 2; exec $browser'
    sleep $DELAY
    swaymsg 'workspace 1; exec $term'
    sleep $DELAY
fi

