# Fix the prompt
[[ -s "$HOME/.bash_prompt" ]] && . "$HOME/.bash_prompt"

# Enable autocompletions
source /usr/local/etc/bash_completion.d/git-completion.bash

# Initialize Bash keybindings and stuff
export INPUTRC=~/.inputrc

# Export EDITOR variables
export EDITOR="vi"
if [[ -e "$(which mate)" ]]; then
  export GIT_EDITOR="mate -w"
fi

# Use Sublime Text if we can find an installation
if [[ -e "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ]]; then
  export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
  export GIT_EDITOR="subl -w"
elif [[ -e "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ]]; then
  export PATH="$PATH:/Applications/Sublime Text 2.app/Contents/SharedSupport/bin"
  export GIT_EDITOR="subl -w"
fi

# Use the same editor for Git and Subversion
if [ "$GIT_EDITOR" != "" ]; then
  export SVN_EDITOR="$GIT_EDITOR"
fi

# Initialize language and locale variables
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Source platform-specific configurations
if [ "$(uname)" == "Darwin" ] ; then
  [[ -e ~/.osx ]] && source ~/.osx
else
  [[ -e ~/.linux ]] && source ~/.linux
fi

[[ -e "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin"

# Initialize JAVA_HOME
export JAVA_HOME="$(/usr/libexec/java_home)"

# Initialize Android SDK stuff
export ANDROID_SDK_ROOT="/usr/local/opt/android-sdk"
export ANDROID_HOME="/usr/local/opt/android-sdk"
alias adb-restart="adb kill-server && adb start-server && adb devices"

# Initialize rbenv (Ruby runtimes)
[[ -e "$(which rbenv)" ]] && eval "$(rbenv init -)"

# Initialize RVM (Ruby runtimes)
if [[ -e "$HOME/.rvm" ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

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
[[ -e "/usr/local/heroku" ]] && export PATH="/usr/local/heroku/bin:$PATH"

### NodeJS stuff
[[ -e /usr/local/share/npm/bin ]] && export PATH="$PATH:/usr/local/share/npm/bin"

### Homebrew configuration
[[ -e ~/.brewrc ]] && source ~/.brewrc
