export BASH_SILENCE_DEPRECATION_WARNING=0

# source ~/.profile
# export PATH="/usr/local/Cellar/node/12.12.0/lib/node_modules/@angular/cli/bin:$PATH"

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_BLACK="\[\033[0;30m\]"
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

source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.zsh

export PS1="\[\033[38;5;75m\]\u\[$(tput sgr0)\]\[$COLOR_RESET\] at \[$(tput sgr0)\]\[\033[38;5;245m\]\h\[$(tput sgr0)\]\[$COLOR_RESET\] in \[$(tput sgr0)\]\[\033[38;5;199m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;11m\]\[\033[38;5;15m\] \[$COLOR_RESET\]\$(git_branch_on)\\[\$(git_color)\]\$(git_branch)\[$COLOR_RESET\]\$\[$COLOR_RESET\] "

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

# React Native Android

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias make=gmake

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ivan/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ivan/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ivan/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ivan/google-cloud-sdk/completion.bash.inc'; fi


# Chrome without web security https://alfilatov.com/posts/run-chrome-without-cors/?fbclid=IwAR0c-sEwx8eL63Yn1rBGV3ddGHneCMg-HWM-vjU2hCouV3qazIVHhKBWCFk
alias chrome-without-security='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'
export GPG_TTY=$(tty)
