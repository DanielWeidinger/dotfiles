#!/bin/sh

CURRENT=$(swaymsg -t get_binding_state | jq -r '.name')

if [[ $CURRENT == 'default' ]]; then
    CURRENT=''
fi

echo $CURRENT

