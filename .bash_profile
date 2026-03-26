#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ~/.bash_profile   (or append to ~/.profile if you use that instead)

# ------------------------------------------------
# Bash profile environment variables
# ------------------------------------------------

# SteamOS Gaming Session
export STEAMOS_GAMEMODE="/opt/steamos-session/steamos-gamemode-enhanced"
export STEAMOS_SESSION_LAUNCHER="/opt/steamos-session/steamos-session-launcher"

#### EXPERIMENTAL ###

# rusticl specific
#export RUSTICL_ENABLE=  # 'iris' for Intel / 'radeonsi' for AMD / "nvk" for Nvidia using nvk+nouveau 
#export OCL_ICD_VENDORS=rusticl.icd

# ------------------------------------------------
# Session Logic
# ------------------------------------------------

# Logic for SteamOS gaming mode
if [[ "$(tty)" == "/dev/tty1" ]]; then

    # --- Start of SteamOS Session (Gamescope) ---

    # Launch SteamOS Session
    clear
    sudo $STEAMOS_GAMEMODE -s lavd -m gaming
    $STEAMOS_SESSION_LAUNCHER
    #$STEAMOS_SESSION_LAUNCHER --hdr --run steam -gamepadui -steamos3 -steamos -steamdeck 2>/dev/null

    # Exit SteamOS Session
    clear
    sudo $STEAMOS_GAMEMODE -x

    # --- Start of Plasma ---

    # Reset GPU/Driver overrides from the gaming session to let Plasma auto-detect
    unset VK_ICD_FILENAMES
    unset __GLX_VENDOR_LIBRARY_NAME
    unset MESA_LOADER_DRIVER_OVERRIDE

    # Set Plasma-specific identity
    export XDG_CURRENT_DESKTOP=KDE
    export XDG_SESSION_DESKTOP=KDE
    export XDG_SESSION_TYPE=wayland

    # Launch Plasma KDE 6
    startplasma-wayland

    # Exit login session
    exit 1
fi
