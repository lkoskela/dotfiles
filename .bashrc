# Fix the prompt
[[ -s "$HOME/.bash_prompt" ]] && . "$HOME/.bash_prompt"

# Enable autocompletions
source /usr/local/etc/bash_completion.d/git-completion.bash

# Initialize Bash keybindings and stuff
export INPUTRC=~/.inputrc

# Source platform-specific configurations
if [ "$(uname)" == "Darwin" ] ; then
  [[ -e ~/.osx ]] && source ~/.osx
else
  [[ -e ~/.linux ]] && source ~/.linux
fi

# Initialize JAVA_HOME
export JAVA_HOME="$(/usr/libexec/java_home)"

# Initialize rbenv (Ruby runtimes)
eval "$(rbenv init -)"

# Automatically invoke bundler for rake, if necessary.
rake() { if [ -e ./Gemfile.lock ]; then bundle exec rake "$@"; else /usr/bin/env rake "$@"; fi; }

# Grep the output of 'ps'
psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }

# Aliases
alias ll="ls -lAFGh"
[[ -e "$(which mvn)" ]] && alias mvn-eclipse="mvn eclipse:eclipse -DdownloadSources=true -DdownloadJavadocs=true"
[[ -e "/Applications/VLC.app/Contents/MacOS/VLC" ]] && alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
[[ -e /usr/bin/open ]] && alias firefox="open -a firefox"
[[ -e "$(which svn)" ]] && alias svn-log-oneline="svn log | perl -l40pe 's/^-+/\n/'"

# Enable color output for grep
export GREP_OPTIONS='--color=auto'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### NodeJS stuff
[[ -e /usr/local/share/npm/bin ]] && export PATH="$PATH:/usr/local/share/npm/bin"
