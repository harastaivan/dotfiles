BOLD="%B"
STOP_BOLD="%b"
RED="%F{red}$BOLD"
YELLOW="%F{yellow}$BOLD"
BLUE="%F{blue}$BOLD"
GRAY="%F{240}$BOLD"
RESET="%F{reset}$STOP_BOLD"

# PROMPT expansion
setopt PROMPT_SUBST

# Load Git completion
zstyle ':completion:*:*:git:*' script /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.zsh
# fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# autoload predict-on
# predict-on
# predict-off

function git_branch {
    ref=$(git symbolic-ref --short --quiet HEAD 2>/dev/null)
    if [ -n "${ref}" ]; then
        echo " on$YELLOW $ref$RESET"
    fi
}

PROMPT="$BLUE%n$RESET in $RED%c$RESET\$(git_branch) %% "
