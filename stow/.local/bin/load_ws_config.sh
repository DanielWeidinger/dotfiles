#!/bin/bash

N_DISPLAYS=$(swaymsg -t get_outputs | jq length)

for ws in $(jq '.[].ws' $1); do
    CMD=$(jq ".[] | select(.ws == $ws)" $1 | jq .cmd)
    DELAY=$(jq ".[] | select(.ws == $ws)" $1 | jq .delay)
    echo $ws
    if [[ $ws = -1 ]]; then
        swaymsg "workspace 1; exec $CMD"
        sleep $DELAY
        swaymsg "move scratchpad"
    else
        echo "starting $CMD at $ws"
        swaymsg "workspace $ws; exec $CMD"
        sleep $DELAY
    fi
done

#Reset to first workspaces
for ((display = 1; display <= $N_DISPLAYS; display++)); do
    swaymsg "workspace $display"
done

exit 0
