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

#### EXPERIMENTAL ###

# rusticl specific
#export RUSTICL_ENABLE=nvk  # Or 'iris' for Intel / 'radeonsi' for AMD
#export OCL_ICD_VENDORS=rusticl.icd

# ------------------------------------------------
# Session Logic
# ------------------------------------------------

# Logic for SteamOS gaming mode
if [[ "$(tty)" == "/dev/tty1" ]]; then
    startplasma-wayland
    clear
    sudo $STEAMOS_SESSION_PATH/steamos-gamemode-enhanced -o on -v $GPU_SETUP
    clear
    $STEAMOS_SESSION_PATH/steamos-session-autolauncher
    clear
    sudo $STEAMOS_SESSION_PATH/steamos-gamemode-enhanced -o off -v $GPU_SETUP
    clear
    exit 1
fi
