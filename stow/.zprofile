# SSH-Agent with systemd
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Start sway
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    echo Starting sway...

    # Sway
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    #GTK
    export GTK_THEME=Nordic
    # Wayland
    export XDG_SESSION_TYPE=wayland
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    # Wayland/Firefox 
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_USE_XINPUT2=1
    # Xwayland compatibility
    export XWAYLAND_NO_GLAMOR=1

    # Wayland Variables for NVIDIA to work correctly
    # Hardware cursors not yet working on wlroots
    # export WLR_NO_HARDWARE_CURSORS=1
    # Set wlroots renderer to Vulkan to avoid flickering
    # export WLR_RENDERER=vulkan
    # OpenGL Variables
    # export GBM_BACKEND=nvidia-drm
    # export __GL_GSYNC_ALLOWED=0
    # export __GL_VRR_ALLOWED=0
    # export __GLX_VENDOR_LIBRARY_NAME=nvidia

    # see "Some programs have a delay when opening under Wayland" (https://wiki.archlinux.org/title/PRIME#Troubleshooting_2)
    export __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json"
    export __GLX_VENDOR_LIBRARY_NAME="mesa"

    exec sway --unsupported-gpu > /var/log/sway/sway.log 2>&1
fi
