export BASH_SILENCE_DEPRECATION_WARNING=1

# source ~/.profile
export PATH="/usr/local/bin:/Applications/MAMP/bin/php/php7.0.20/bin:$PATH"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export -f parse_git_branch

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  # if [[ ! $git_status =~ "nothing to commit" ]]; then
    # echo -e $COLOR_GREEN
  # elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    # echo -e $COLOR_YELLOW
  # elif [[ $git_status =~ "nothing to commit" ]]; then
    # echo -e $COLOR_GREEN
  # else
    # echo -e $COLOR_OCHRE
  # fi
  echo -e $COLOR_YELLOW
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "$branch "
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "$commit "
  fi
}

function git_branch_on {
    if [[ $(git_branch) != "" ]]; then
        echo "on "
    fi
}

export PS1="\[\033[38;5;75m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] at \[$(tput sgr0)\]\[\033[38;5;245m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput sgr0)\]\[\033[38;5;199m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;11m\]\[\033[38;5;15m\] \[$COLOR_WHITE\]\$(git_branch_on)\\[\$(git_color)\]\$(git_branch)\[$COLOR_WHITE\]\$\[$COLOR_RESET\] "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'

# virtualenvwrapper
# export WORKON_HOME=~/.Envs
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
alias python=python3
alias pip=pip3
# source /usr/local/bin/virtualenvwrapper.sh
# export PATH="/usr/local/opt/php@7.2/bin:$PATH"
# export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# React Native Android

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias make=gmake
