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
alias ldot='ls -a $LS_COLOR | grep ^\\.' # show files start with dot(config files)
alias ldev='ls /dev $LS_COLOR | grep sd.' # show devices in /dev, like pen-drive and disks

# start GUIs
alias starti='startx $HOME/.xinitrc i3'
alias startxf='startx $HOME/.xinitrc xfce4'

# i3
alias i3c='vim $HOME/.config/i3/config' # open in $EDITOR i3wm file config
alias barc='vim ~/.config/i3/i3status.conf' # open status bar config file

# VirtualBox
alias vmon='VBoxManage startvm'
alias vml='VBoxManage list vms'
alias vmc='VBoxManage controlvm'

# youtube-dl TODO: make a script verification if directory exist and  have free space
alias youv='youtube-dl -o "$HOME/media/videos/%(title)s.%(ext)s" -f bestvideo+bestaudio'
alias youm='youtube-dl -o "$HOME/media/musics/%(title)s.%(ext)s" --extract-audio --audio-format=mp3 --audio-quality=0 --embed-thumbnail'

# dnf - packages management
alias dcln='dnf clean all'
alias dckup='dnf check-update'
alias dup='sudo dnf update'
alias dr='sudo dnf remove'
alias darm='sudo dnf autoremove'
alias di='sudo dnf install'
alias ds='dnf search'
alias din='dnf info'
alias dl='dnf list'
alias dla='dnf list available'
alias dli='dnf list installed'
alias drepo='dnf repolist'
alias drepoall='dnf repolist all'
alias dprov='dnf provides'
alias dh='dnf history'
alias dw='dnf download --source'

# git
alias gi='git init'
alias gs='git status'
alias gra='git remote add'
alias grao='git remote add origin'
alias gcout='git checkout'
alias gcoutb='git checkout -b'
alias gd='git diff'
alias ga='git add'
alias gad='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gpsh='git push origin'
alias gpll='git pull origin'
alias gl='git log'
alias gcl='git config --list'

#git flow
alias gli='git-flow init'
alias gfsf='git-flow feature start'
alias glff='git-flow feature finish'
alias gl='git-flow release start'
alias glrf='git-flow release finish'
alias glhs='git-flow hotfix start'
alias glhf='git-flow hotfix finish'

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
alias storm='phpstorm'
alias chownk='sudo chown -R $USER:$USER'
alias cdw='cd /var/www'
alias v='vim'
alias ipflush='ipt -F'
alias pipl='pip list --format=columns'
alias cls='tput clear'
alias bcq='tput clear && bc -q'

alias cronl='crontab -l'
alias crone='crontab -e'
alias cronx='crontab -x' # enable debugging
alias crons='crontab -s' # selinux context

# security
alias sw3m="torsocks s3m ip-check.info/?lang=en"
alias snmap="torsocks nmap"
alias sfirefox="torsocks firefox"
alias perl5libs='perl -E "say join \"\n\", split\":\", \$ENV{PERL5LIB}"'
