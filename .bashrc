# ~/.bashrc
#

HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# // debian conf

#HISTSIZE=-1
#HISTFILESIZE=-1

# Define colors for use above
#color_off='[\033[00m]'
#red='[\033[01:31m]'
#red_bold='\[\033[01:31m\]'
#red_underline='\[\033[04:31m\]'
#

#if [ -z "{debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=(cat /etc/debian_chroot)
#fi

#case $XTERM in
#    xterm-color)color_prompt=yes;;
#esac

# banner
#clear
#echo -e '\n#######################################\n'
#echo -e "           Welcome my master\n"
#echo -e "         $red Tell me your command... $color_off \n"
#echo -e '#######################################\n'

#
# If not running interactively. don`t do anything
#case $- in
#    *i*) ;;
#     *) return;;
#esac
# //

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
       colot_prompt=
    fi
fi

# // debian
#if [ "$color_prompt" = yes ]; then
#    # red
#    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\    $ '
#    # yellow underline
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[04;33m\]\u@\[\033[01;32m\]\h\[\033[00m\]\[\033[00m\]:\[\03    3[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

#unset color_prompt force_color_prompt

# if is a xterm set  title to user@host:dir
#case "$TERM" in
#    xterm*|rxvt*)
#        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#        ;;
#    *)
#        ;;
#esac

export LS_COLOR='--color=auto'

if [ -x /usr/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls $LS_COLOR'
    alias grep='grep $LS_COLOR'
    alias egrep='grep $LS_COLOR'
fi

# avoid mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias zip='zip -r'

alias ls='ls $LS_COLOR'
alias ll='ls -lh $LS_COLOR'
alias la='ls -lah $LS_COLOR'
alias l='ls -lAh $LS_COLOR'
alias ldot='ls -a $LS_COLOR | egrep ^\\.'
alias ldev='ls /dev $LS_COLOR | egrep sd.'


alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias starti='startx $HOME/.xinitrc i3'
alias startg='startx $HOME/.xinitrc gnome'

alias i3c='vim $HOME/.i3/config'
alias i3b='vim $HOME/.i3/status'
alias i3down='$HOME/.i3/i3exit shutdown'
alias i3reboot'$HOME/.i3/i3exit reboot'

alias v='vim'

alias vm='VBoxManage'
alias vmon='VBoxManage startvm'
alias vmsl='VBoxManage list vms'
alias vbc='VBoxManage controlvm'

alias youx='cd $HOME/xp && youtube-dl'
alias yout='cd $HOME/videos && youtube-dl'
alias youm='cd $HOME/musics && youtube-dl --extract-audio --audio-format=mp3'

alias nitro='nitrogen $HOME/nitro'
alias scrot='scrot -q 100'
alias sudo='sudo '

alias fetch='screenfetch'

alias bashc='vim $HOME/.bashrc'

clear
screenfetch
