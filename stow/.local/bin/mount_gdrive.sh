#!/bin/bash

GDRIVE_PATH="TPH"
MOUNT_PATH="$HOME/TPH"
if [ ! -d "$MOUNT_PATH" ]; then
    echo "$MOUNT_PATH does not exist; creating..."
    mkdir $MOUNT_PATH
fi

dunstify -a "mouting_gdrive" "Mounting Google Drive folder $GDRIVE_PATH to $MOUNT_PATH" -t 3000
rclone mount "drive:$GDRIVE_PATH" $MOUNT_PATH
