#!/bin/zsh

# ~/.zshrc executed by zsh

source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/bindkeys.zsh
#source ~/.zsh/completion.zsh
source ~/.zsh/zsh_hooks.zsh
#source  ${HOME}/.dotfiles/z/z.sh
#source ~/.zsh/daemon-banner.sh

# Pluggin for highlight syntax
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s histappend
shopt -s checkwinsize

clear
#screenfetch
~/.zsh/daemon-banner.sh
