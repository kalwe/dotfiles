# .bash_profile

# Get the aliases and functions
[[ -f ~/.bashrc ]] && . ~/.bashrc

# User specific environment and startup programs

[[ -d "$HOME/local" ]] && PATH=$PATH:$HOME/bin:$HOME/local/bin
export PATH

EDITOR=vim
export EDITOR

LS_COLOR='--color=auto'
export LS_COLOR

[[ -d "$HOME/perl5" ]] &&  PERL5LIB="$HOME/perl5/lib/modules"
export PERL5LIB

