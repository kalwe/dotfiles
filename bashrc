# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth

# If not running interactively, don`t do anything
[[ $- != *i* ]] && return

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi
unset force_color_prompt

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_functions ]; then
  . $HOME/.bash_functions
fi

# Define my custom PS1 and PS2
if [ $(id -u) -eq 0 ]; then # you are root
  PS1="\n\n\e[1m\] [ \e[31;5m\]\$\u\e[0m\] : \e[93m\]\w\e[0m\] \e[1m\]]\n=>\e[0m\] "
  PS2="\[\033[1m\]>>\[\033[0m\] "
else # normal user
  PS1="\n\[\e[1m\] [ \[\e[031m\]\$ \[\e[4m\] \u \[\e[0m\] \[\e[1m\]:\[\e[0m\] \[\e[93m\]\w\[\e[0m\] : \$? \[\e[1m\]]\[\e[0m\]\[\$(parse_git_branch)\] \[\e[1m\]\n ->\[\e[0m\] "
  PS2="\[\033[1m\] >>\[\033[0m\] "
fi

export PS1
export PS2

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc' # note the . (dot) before vimrc. If that is what u have called it.

export PERL5LIB="$PERL5LIB:$HOME/scripts/perl/modules:$HOME/local/src/perl/modules"

clear
echo "         ,   ,"
echo "        /(   )\\           MMAD "
echo "        \ \_/ /   , /\ ,"
echo -e "        /\e[31m_   _\e[0m\  /| || |\\"
echo -e "   King Of The Dead Daemon XXX "


