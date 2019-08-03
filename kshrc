. /etc/ksh.kshrc

set -o allexport

PWD=$(pwd)
OLDPWD=${PWD}

unmask 022
unlimit -c unlimited

[[ -s "$HOME/.aliases" ]] && . $HOME/.aliases
[[ -s "$HOME/.user_functions" ]] && . $HOME/.user_functions

UBANG='$'
[[ "$(id -u)" -eq "0" ]] && UBANG='\e[91m#\e[0m'

PS1="
 \e[1m[ \e[31m${LOGNAME}\e[0m\e[1m in \e[33m\w\e[0m\e[1m : \$? ]\$(gbranch)
 ${UBANG} ->\e[0m "
PS2=" \e[1m>>\e[0m "
export PS1 PS2

set +o allexport
clear
