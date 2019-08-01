# .bash_profile

# Get the aliases and functions
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# User specific environment and startup programs

if [ -d "$HOME/local" ]; then
  PATH=$PATH:$HOME/bin:$HOME/local/bin
fi
export PATH

EDITOR=vim
export EDITOR

LS_COLOR='--color=auto'
export LS_COLOR

export KERN_DIR=/usr/src/kernels/`uname -r`

if [ -d "$HOME/perl5" ]; then
  PERL5LIB="$HOME/perl5/lib/modules"; export PERL5LIB
fi

