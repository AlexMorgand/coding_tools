# Set up the prompt

autoload -Uz promptinit
promptinit
prompt walters

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Alex conf

#Fichiers resource
# source $HOME/.zsh/.zshrc

# chut !
#set nobeep
#xset b off

# couleurs
eval `dircolors $HOME/.zsh/colors`
autoload -U zutil
autoload -U compinit
autoload -U complist
compinit

# Active le pavé numérique quand on se loggue en console
case "`tty`" in /dev/tty[1-6]*)
setleds +num
esac

#new line
new_line=$'\n'

# for have colors
autoload -U colors
colors
# define your colors here //Need to clean that shit PURPLE ? OTHER COLORS ?
# affiche du vert -> echo -e '\e[1;32m{%}'
yellow="yellow"
red="red"
gray="gray"
white="white"
red="%B%{$fg[$red]%}"
blue="%B%{$fg[$blue]%}"
light_yellow="%B%{$fg[$yellow]%}"
dark_yellow="%{$fg[$yellow]%}"
light_green=`echo -e "\e[1;32m"`
dark_green=`echo -e "\e[2;32m"`
gold=`echo -e "\e[1;33m"`
blue=`echo -e "\e[1;34m"`
purple=`echo -e "\e[1;35m"`

date=`date +%H:%M`
#set prompt =
PS1="${new_line}${red}$date ${blue}%0?${reset_color} [ ${gold}\\m/${reset_color} ${dark_green}%n${reset_color} ${red}\\m/${reset_color} @ ${dark_green} 8${RESET_COLOR}${blue}%~${reset_color}>$new_line$ "
PS2="${purple}>"

# Pour ne pas avoir de "beep"
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

#Useless colors for ls
alias ls='ls --color=auto'

# editeur par default
export EDITOR='vim'

# Configuration pour ROS
source /opt/ros/setup.zsh
source /home/ballz/gostai/ros_workspace/setup.sh
export PATH="/usr/bin/urbi/bin:$PATH"

# Aliases
alias ..="cd .."
alias la="ls -la"
