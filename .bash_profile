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
#export RUSTICL_ENABLE=nvk  # 'iris' for Intel / 'radeonsi' for AMD / "nvk" for Nvidia using nvk+nouveau
#export OCL_ICD_VENDORS=rusticl.icd

# ------------------------------------------------
# Session Logic
# ------------------------------------------------

# --- Start of SteamOS Session (Gamescope) ---

# Launch SteamOS Session
clear
sudo $STEAMOS_GAMEMODE -s lavd -m gaming
clear
$STEAMOS_SESSION_LAUNCHER

# Exit SteamOS Session
clear
sudo $STEAMOS_GAMEMODE -x
clear

# Return to a Plasma KDE session
exec dbus-run-session startplasma-wayland

# Final Stage And Cleanup Of Session
unset SESSION_BINARY
clear
sudo /usr/bin/systemctl restart getty@tty1.service
