#!/bin/zsh
# Prompt

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        colot_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="$fg_bold[red] $ %U %n %u$reset_color $fg_bold[yellow][ %d ]"$'\n'"$fg_bold[green] -> $reset_color"
else
    PS1=' Alguma coisa deu errado =( ->'
fi
