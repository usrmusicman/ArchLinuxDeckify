#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ~/.bash_profile   (or append to ~/.profile if you use that instead)

# ------------------------------------------------
# Bash profile environment variables
# ------------------------------------------------

# SteamOS Gaming Session
export STEAMOS_GAMEMODE="/home/$USER/.local/bin/steamos-session/steamos-gamemode-enhanced"
export STEAMOS_SESSION_LAUNCHER="/home/$USER/.local/bin/steamos-session/steamos-session-launcher"

#### EXPERIMENTAL ###

# rusticl specific
#export RUSTICL_ENABLE=  # 'iris' for Intel / 'radeonsi' for AMD / "nvk" for Nvidia using nvk+nouveau 
#export OCL_ICD_VENDORS=rusticl.icd

# ------------------------------------------------
# Session Logic
# ------------------------------------------------

# Logic for SteamOS gaming mode
if [[ "$(tty)" == "/dev/tty1" ]]; then
    clear
    sudo $STEAMOS_GAMEMODE -s lavd -m gaming
    sleep 3
    clear
    $STEAMOS_SESSION_LAUNCHER --hdr --run steam -gamepadui -steamos3 -steamos -steamdeck 2>/dev/null
    clear
    sudo $STEAMOS_GAMEMODE -x
    clear
    startplasma-wayland
    exit 1
fi
