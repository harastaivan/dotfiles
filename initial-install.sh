# Install brew if not already installed
command -v brew &> /dev/null && echo "brew already installed"
command -v brew &> /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cli apps
brew install composer deno gnupg go speedtest-cli node yarn

# Install cask (desktop) apps
brew cask install adobe-creative-cloud battle-net brooklyn discord docker google-chrome insomnia jetbrains-toolbox messenger microsoft-teams slack spotify visual-studio-code vlc 

# Optionals -- uncomment
# brew install composer omnidisksweeper visual-studio

# brew leaves       
# cocoapods composer deno gdb gitlab-runner gnupg go heroku/brew/heroku highlight kubernetes-cli make minimal-racket mongodb/brew/mongodb-community mono mysql koala42/harasta/openssl@1.0.2t php exolnet/deprecated/php@7.0 php@7.2 pinentry-mac pstree speedtest-cli watchman wget yarn

# brew list --cask
# adoptopenjdk8 basictex brooklyn discord font-fira-code google-chrome insomnia jetbrains-toolbox miniconda mono-mdk-for-visual-studio omnidisksweeper spotify visual-studio visual-studio-code vlc
