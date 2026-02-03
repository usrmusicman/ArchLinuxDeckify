#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ~/.bash_profile   (or append to ~/.profile if you use that instead)

# ------------------------------------------------
# Bash profile environment variables
# ------------------------------------------------

# SteamOS Gaming Session
export STEAMOS_SESSION_PATH="$HOME/.local/bin/steamos-session"
export STEAMOS_SESSION_CONFIG="$HOME/.config/steamos-session/steamos-session-config"
source $STEAMOS_SESSION_CONFIG

# Plasma desktop environment variables
export XDG_RUNTIME_DIR=/run/user/$(id -u username)
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="KDE"
export KDE_SESSION_VERSION=6
export QT_QPA_PLATFORM="wayland;xcb"

#### EXPERIMENTAL ###

# rusticl specific
#export RUSTICL_ENABLE=nvk  # Or 'iris' for Intel / 'radeonsi' for AMD
#export OCL_ICD_VENDORS=rusticl.icd

# ------------------------------------------------
# Session Logic
# ------------------------------------------------

# Logic for SteamOS gaming mode
if [[ "$(tty)" == "/dev/tty1" ]]; then
    clear
    sudo $STEAMOS_SESSION_PATH/steamos-gamemode-enhanced -d start -s lavd -m gaming -p on -v $GPU_SETUP
    clear
    $STEAMOS_SESSION_PATH/steamos-session-autolauncher
    clear
    sudo $STEAMOS_SESSION_PATH/steamos-gamemode-enhanced -d stop -p off -v $GPU_SETUP
    clear
    startplasma-wayland
    exit 1
fi
