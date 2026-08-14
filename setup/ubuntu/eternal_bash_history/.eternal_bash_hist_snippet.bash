# Eternal bash history
# --------------------
# Source this file in your ~/.bashrc:
#   source /path/to/.eternal_bash_hist_snippet.bash
# e.g. source $HOME/.eternal_bash_hist_snippet.bash

# Append to the history file on exit instead of overwriting it.
shopt -s histappend

# Unlimited history size.
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=

# Timestamp each history entry.
export HISTTIMEFORMAT="[%F %T] "

# Don't put duplicate lines or lines starting with a space in the history.
export HISTCONTROL=ignoreboth

# Store history in a dedicated file that won't be truncated by other sessions.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# Write the current session's history to the file after every command,
# so a crash or closed terminal never loses commands.
# http://superuser.com/questions/20900/bash-history-loss
# This writes your last command (-a), clears current memory (-c), and reads the fresh file (-r)
# This is the industry-standard way to share history across terminals cleanly without duplicates.
# PROMPT_COMMAND is still needed in some other places
# The PROMPT_COMMAND variable is optional and is used to define a command or a series of commands that Bash executes just before displaying the primary prompt (PS1).
if [[ -z "${PROMPT_COMMAND:-}" ]]; then
    export PROMPT_COMMAND="history -a; history -c; history -r"
else
    export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
fi

# Readline keybindings for history search
# ----------------------------------------
# Only apply when line-editing is active (default in interactive shells).
if [[ "$(set -o | grep -E 'emacs|\bvi\b' | cut -f2 | tr '\n' ':')" != 'off:off:' ]]; then
    # When typing a prefix and pressing Page Up/Down, cycle through matching history entries.
    bind '"\e[5~": history-search-backward'
    bind '"\e[6~": history-search-forward'
    # Show completion list immediately if input is ambiguous.
    bind 'set show-all-if-ambiguous on'
    # Case-insensitive history search.
    bind 'set completion-ignore-case on'
fi
