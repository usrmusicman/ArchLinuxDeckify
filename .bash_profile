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
if [[ "$(tty)" == "/dev/tty6" ]]; then

    # --- Start of SteamOS Session (Gamescope) ---

    # Stop Plasma
    if [[ -x "/usr/bin/gdm" ]]; then
        sudo /usr/bin/systemctl stop gdm.service
    elif [[ -x "/usr/bin/lightdm" ]]; then
        sudo /usr/bin/systemctl stop lightdm.service
    elif [[ -x "/usr/bin/plasmalogin" ]]; then
        sudo /usr/bin/systemctl stop plasmalogin.service
    elif [[ -x "/usr/bin/sddm" ]]; then
        sudo /usr/bin/systemctl stop sddm.service
    else
        echo "Display manager not supported"
    fi

    # Launch SteamOS Session
    clear
    sudo $STEAMOS_GAMEMODE -s lavd -m gaming
    $STEAMOS_SESSION_LAUNCHER

    # Exit SteamOS Session
    clear
    sudo $STEAMOS_GAMEMODE -x
    clear

    # Start of Plasma
    if [[ -x "/usr/bin/gdm" ]]; then
        sudo /usr/bin/systemctl start gdm.service
    elif [[ -x "/usr/bin/lightdm" ]]; then
        sudo /usr/bin/systemctl start lightdm.service
    elif [[ -x "/usr/bin/plasmalogin" ]]; then
        sudo /usr/bin/systemctl start plasmalogin.service
    elif [[ -x "/usr/bin/sddm" ]]; then
        sudo /usr/bin/systemctl start sddm.service
    else
        echo "Display manager not supported"
    fi

fi
