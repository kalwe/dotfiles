# my custom aliases

# for security
alias rm='rm -i'
alias cp='cp -ip' # 'p' to preserv
alias mv='mv -i'

# open config files
alias bashc='vim $HOME/.bashrc'
alias aliasc='vim $HOME/.bash_aliases'
alias bashfunc='vim $HOME/.bash_functions'
alias vimc='vim $HOME/.vim/.vimrc'
alias resourcc='vim $HOME/.Xresources'

# directory movements
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# grep
#alias egrep='grep -E'
alias igrep='grep -i'
alias vgrep='grep -v'
alias sgrep='grep -s'
alias agrep='grep -a'
alias rgrep='grep -r'
alias cgrep='grep -c'
alias wgrep='grep -w'

# ls
alias lsd='ls -aFhlG $LS_COLOR'
alias l='ls $LS_COLOR'
alias ll='ls -lh $LS_COLOR'
alias la='ls -ah $LS_COLOR'
alias ldot='ls -a $LS_COLOR | grep ^\\.' # show dotfiles
alias ldev='ls /dev $LS_COLOR | grep sd.' # show devices in /dev

# start GUIs
alias starti='startx $HOME/.xinitrc i3'
alias startxf='startx $HOME/.xinitrc xfce4'

# i3
alias i3c='vim $HOME/.config/i3/config'
alias barc='vim ~/.config/i3/i3status.conf'

# VirtualBox
alias vmon='VBoxManage startvm'
alias vml='VBoxManage list vms'
alias vmc='VBoxManage controlvm'

# ps
alias psu="ps -fu $USER" ||="ls -lart"

# docker
alias dockeron='sudo systemctl start docker'
alias dockeroff='sudo systemctl stop docker'
alias dockerstatus='sudo systemctl status docker'
alias dockerps='docker ps'
alias dockerpsa='docker ps -a'
alias dockera='docker attach'
alias dockeri='docker images'
alias dockers='docker stop'
alias dockerr='docker run'
alias dockerrm='docker rm'

# custom
alias fetch='screenfetch'
alias chownu='chown $USER:$USER'
alias chownur='chown -R $USER:$USER'
alias cdw='cd /var/www'
alias v='vim'
alias ipflush='ipt -F'
alias pipl='pip list --format=columns'
alias cls='tput clear'
alias bcq='tput clear && bc -q'
alias xmerge='xrdb -merge $HOME/.Xresources'
alias psu='ps -u $USER'
alias free='free -m'

alias cronl='crontab -l'
alias crone='crontab -e'
alias cronx='crontab -x' # enable debugging
alias crons='crontab -s' # selinux context

# security
alias sw3m="torsocks s3m ip-check.info/?lang=en"
alias snmap="torsocks nmap"
alias sfirefox="torsocks firefox"

# youtube-dl TODO: make a script verification if directory exist and  have free space
alias youv='youtube-dl -o "$HOME/media/videos/%(title)s.%(ext)s" -f bestvideo+bestaudio'
alias youm='youtube-dl -o "$HOME/media/musics/%(title)s.%(ext)s" --extract-audio --audio-format=mp3 --audio-quality=0 --embed-thumbnail'

