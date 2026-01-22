#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ~/.bash_profile   (or append to ~/.profile if you use that instead)

# Put the path to the SteamOS Steamdeck session startup script here
STEAMOS_SESSION_DECK="$HOME/.local/bin/steamos-session/steamos-session-launcher nvidia"

# Only run on tty3 – auto-start Gaming Mode after successful login
if [[ "$(tty)" == "/dev/tty3" ]]; then

    # Launch the dedicated Gamescope/Steam session
    $STEAMOS_SESSION_DECK

fi
