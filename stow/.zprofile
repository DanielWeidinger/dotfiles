# SSH-Agent with systemd
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Start sway
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    echo Starting sway...

    # QT Only
    export QT_QPA_PLATFORMTHEME="qt5ct"
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    # Wayland
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export XDG_CURRENT_SESSION_TYPE=wayland
    # Sway
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway

    #GTK
    export GTK_THEME=Nordic
    export MOZ_ENABLE_WAYLAND=1
    exec sway > /var/log/sway/sway.log 2>&1
fi
