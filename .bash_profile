# .bash_profile file
# By Balaji S. Srinivasan (balajis@stanford.edu)
#
# Concepts:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#
#    2) .bash_profile is the *login* config for bash, launched upon first
#        connection (in Ubuntu)
#
#    3) .bash_profile imports .bashrc in our script, but not vice versa.
#
#    4) .bashrc imports .bashrc_custom in our script, which can be used to
#        override variables specified here.
#
# When using GNU screen:
#
#    1) .bash_profile is loaded the first time you login, and should be used
#       only for paths and environmental settings

#    2) .bashrc is loaded in each subsequent screen, and should be used for
#       aliases and things like writing to .bash_eternal_history (see below)
#
# Do 'man bashrc' for the long version or see here:
# http://en.wikipedia.org/wiki/Bash#Startup_scripts
#
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.

## -----------------------
## -- 1) Import .bashrc --
## -----------------------

# Factor out all repeated profile initialization into .bashrc
#  - All non-login shell parameters go there
#  - All declarations repeated for each screen session go there
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:~/install/arcanist/bin

function print_symlink {
    wd="$(pwd)"
    linkdir="$(readlink -n $wd)";
    if readlink -n $wd >/dev/null; then
echo " -> $linkdir ";
    fi
}
 
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}") "
}
 
alias ls='ls -F'
alias rm='rm -i'
 
export PS1='[\T]\[\e[0;32m\] \w\[\e[0;36m\]$(print_symlink)\[\e[0;31m\]$(parse_git_branch)\[\e[0m\] $ '

# Init jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Set up bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
