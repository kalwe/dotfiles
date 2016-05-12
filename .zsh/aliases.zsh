#!/bin/zsh
#
# Add a lot of alias defined by the user

#
alias sd='sudo'
 
# directory movement
#
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bk='cd $OLDPWD'

# directory information
#
alias lsd='ls -aFhlG --color'
alias l='ls -al --color'
#alias ls='ls -GFh --color=auto' # Colorize output, add file type indicator, and put sizes in human readable format
#alias ll='ls -GFhl --color=auto' # Same as above, but in long listing format
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'dus=du -sckx * | sort -nr' #directories sorted by size

alias 'wordy=wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# Git
#
alias gitc='vim $HOME/.gitconfig'
alias g='git'
alias ga='git add'
alias gaf='git add -f'
alias gaa='git add .'
alias grm='git rm --cache'
alias git rm='git rm --cache'
alias gps='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcn='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'

# leverage aliases from ~/.gitconfig
alias gh='git hist'
alias gt='git today'

# curiosities 
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"


# alias to cat this file to display
alias calias='< $HOME/.zsh/aliases.zsh'
alias aliasc='vim $HOME/.zsh/aliases.zsh'
alias fcat='< $HOME/.zsh/functions.zsh'
alias func='vim $HOME/.zsh/functions.zsh'
alias sz='source $HOME/.zshrc'


# Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh
#

alias wtf='journalctl -k -f'
alias vererros='cat /var/log/errors.log'
alias manuel='man'
alias falar='echo'
alias pegar='cat'
alias mais='more'
alias fd='mkdir'
alias deleta='rm -i'
alias duplicate='cp'
alias teleport='mv'
alias md='cd'
alias da='pwd'
alias inur='locate'
alias nomz='ps aux | less'
alias killbill='killall'
alias reset='reboot'
alias falou='halt'
alias chapou='poweroff'

#
# My own alias
#

# daemon
alias daemon='$HOME/.zsh/daemon-banner.sh'
alias daemonc='vim $HOME/.zsh/daemon-banner.sh'

# random
alias i3c='vim $HOME/.i3/config'
alias tailf='tail -f'
alias free='free -m'
alias v='vim'
alias fetch='screenfetch'
alias df='df -h'
alias nitro='nitrogen $HOME/nitro'
alias scrot='scrot -q 100'
alias zip='zip -r'
alias cdh='cd $HOME'
alias hist='history 0'

# ls
alias ls='ls --color'
alias ll='ls -lh --color'
alias la='ls -lah --color'
alias l='ls -lAh --color'
alias ldot='ls -a --color | egrep \^\\.'
alias ldev='ls /dev | grep sd'
alias lz='ls $HOME/.zsh'

# virtualBox
alias vmon='VBoxManage startvm'
alias vmsl='VBoxManage list vms'
alias vbc='VBoxManage controlvm'


# iptables
alias firelog='journalctl -k -f | grep FIREWALL'
alias fires='fireoff && fireon'
alias fireon='iptables-restore < $HOME/.iptables/iptables.net'
alias fireoff='iptables-restore < $HOME/.iptables/iptables.default'
alias fires='iptables -nvL --wline-numbers'
alias firesw='watch iptables -wnvL --line-numbers'
alias fireswn='watch iptables -t nat -wnvL --line-numbers'
alias firedev='iptables-restore < ~/.iptables/iptables.test && iptables -nvL --line-numbers'
alias firetor='iptables-restore < $HOME/.iptables/iptables.tortest && iptables -nvL --line-numbers'
alias firec='vim $HOME/.iptables/iptables.net'

# network
alias ifconfig='ifconfig -a'
alias net='netctl'
alias resolvc='vim /etc/resolv.conf'
alias resolvs='cat /etc/resolv.conf'
alias ipshow='ip addr show'
alias upf='ip link set enp2s0 up'
alias fdown='ip link set enp2s0 down'
alias ipaddr='ip addr add 192.168.1.50/24 broadcast 192.168.1.255 dev enp2s0'
alias routeadd='ip route add default via'
alias routeaddd='ip route add default via 192.168.0.1'
alias iflush='ip addr flush dev enp2s0'
alias rflush='ip route flush dev enp2s0'
alias anub='ss -anultp'
alias ping4='ping -c4'

# pacman
alias pacsy='pacman -Syy'
alias pacsu='pacman -Syu'
alias pacs='pacman -S'
alias pacss='pacman -Ss |grep '
alias pacr='pacman -R'
alias pacrr='pacman -Rcu'
alias pacra='pacmna -Rns'
alias pacc='vim /etc/pacman.conf'
alias pacq='pacman -Q'

# tor
alias torl='tail -f /var/log/tor/log'
alias torc='vim /etc/tor/torrc'
alias toron='systemctl start tor.service'
alias toroff='systemctl stop tor.service'
alias tores='systemctl restart tor.service'

# pdns
alias pdnsoff='systemctl stop pdnsd'
alias pdnson='systemctl start pdnsd'
alias pdnsres='systemctl restart pdnsd'

# shell conf
alias bashc='vim ~/.bashrc'
alias zshc='vim ~/.zshrc'
