#############################################################################
# According to the bash man page, .bash_profile is executed for login shells,
# while .bashrc is executed for interactive non-login shells. Therefore,
# let's add here just the kind of stuff that we want to see when logging in
# through SSH or similar, not when opening a new tab in a terminal app.
# All that other stuff should go to .bashrc, which we source from here.
#############################################################################

[[ -s "$HOME/.bashrc" ]] && . "$HOME/.bashrc"