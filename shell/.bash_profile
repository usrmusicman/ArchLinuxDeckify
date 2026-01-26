#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ~/.bash_profile   (or append to ~/.profile if you use that instead)

# ------------------------------------------------
# Bash profile environment variables
# ------------------------------------------------

# PATH for SteamOS Gaming Session
export STEAMOS_SESSION_PATH="$HOME/.local/bin/steamos-session"

# Plasma desktop environment variables
export XDG_RUNTIME_DIR=/run/user/$(id -u artofmusic)
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

# Run the KDE Plasma on tty1 by default
if [[ "$(tty)" == "/dev/tty1" ]]; then
	exec $STEAMOS_SESSION_PATH/steamos-session-autolauncher
fi

# Run SteamOS Session on tty2 by default
if [[ "$(tty)" == "/dev/tty2" ]]; then
	exec startplasma-wayland
fi
