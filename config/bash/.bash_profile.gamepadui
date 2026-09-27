#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ~/.bash_profile   (or append to ~/.profile if you use that instead)

# ------------------------------------------------
# Experimental Features
# ------------------------------------------------

# rusticl specific
#export RUSTICL_ENABLE=nvk  # 'iris' for Intel / 'radeonsi' for AMD / "nvk" for Nvidia using nvk+nouveau
#export OCL_ICD_VENDORS=rusticl.icd

# ------------------------------------------------
# SteamOS Session Launchers
# ------------------------------------------------
export STEAMOS_SESSION_PATH="/opt/steamos-session"
export STEAMOS_SESSION_LAUNCHER="$STEAMOS_SESSION_PATH/steamos-session-launcher"
export DESKTOP_AUTOLOGIN="startplasma-wayland"

# Session Logic
if [ "$(tty)" = "/dev/tty1" ]; then
    while true; do
        clear
        $DESKTOP_AUTOLOGIN
        clear
        $STEAMOS_SESSION_LAUNCHER
        clear

        # Optional: Prevent CPU throttling if the commands fail instantly
        sleep 1
    done
fi
