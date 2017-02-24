#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '


PATH=$PATH:/home/pablo/bin

source ~/.git-prompt.sh

PS1='\[\033[1;32m\][\[\033[1;96m\]\u\[\033[1;31m\] ♥ \[\033[1;96m\]\w\[\e[1;33m\]$(__git_ps1 " (%s)")\[\e[1;32m\]]\[\033[1;96m\]$ \[\033[0;37m\] \[\e[0m\]'
