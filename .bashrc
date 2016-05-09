# ~/.bashrc
#

HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
       colot_prompt=
    fi
fi

export LS_COLOR='--color=auto'

if [ -x /usr/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls $LS_COLOR'
    alias grep='grep $LS_COLOR'
    alias egrep='grep $LS_COLOR'
fi


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
