# sh/ksh initialization

HISTSIZE=
HISTFILESIZE=
HISTFILE=$HOME/.ksh_hist
export HISTSIZE HISTFILESIZE HISTFILE

[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
[[ -d $HOME/local/bin ]] && PATH=$PATH:$HOME/local/bin
export PATH HOME TERM

PKG_PATH="https://ftp.openbsd.org/pub/OpenBSD/6.4/packages/amd64/"
export PKG_PATH

[ -z "$LOGNAME" ] && export LOGNAME=`logname`

export ENV=$HOME/.kshrc
