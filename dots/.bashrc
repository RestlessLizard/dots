# ~/.bashrc If not running interactively, don't do anything 
[[ $- != *i* ]] && return 

stty -ixon
shopt -s autocd
HISTSIZE= HISTFILESIZE= #Infinite

#PS1='[\u@\h \W]\$ ' 
PS1='\[\e[0;33m\]\W\[\e[0m\] >> '

tabs -4 

source ~/.aliases

alias save='echo "$*" >> .vimwiki/youknow.wiki'
