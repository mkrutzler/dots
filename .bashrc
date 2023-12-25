#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=~/.local/bin/:$PATH
alias ls='ls --color=auto'
alias la='ls --color=auto -la'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
