# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

HISTSIZE=
HISTFILE='.histfile'
HISTFILESIZE=
export HISTSIZE HISTFILE HISTFILESIZE

[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
[[ -d $HOME/local/bin ]] && PATH=$PATH:$HOME/local/bin
export PATH HOME TERM

PKG_PATH="https://ftp.openbsd.org/pub/OpenBSD/6.4/packages/amd64/"
export PKG_PATH

[[ -z "$LOGNAME" ]] && export LOGNAME=`logname`

export ENV=$HOME/.kshrc
