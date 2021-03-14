# Avoid duplicates
HISTCONTROL=ignoredups:erasedups

export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
