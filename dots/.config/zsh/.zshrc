autoload -U colors && colors

PS1='%F{yellow}%1~%f >> '

zle -N zle-keymap-select

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
# Timestamps
setopt EXTENDED_HISTORY

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

bindkey -e

autoload edit-command-line; zle -N edit-command-line

source ~/.aliases

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#source /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

bindkey '^[a' autosuggest-accept

#alias history='fc -lnd'

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

