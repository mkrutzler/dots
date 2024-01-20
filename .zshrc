#!/bin/bash

# Add Binaries to PATH

# MACOS
#PATH="/Users/markkrutzler/Library/Python/3.9/bin:$PATH"
#PATH="/opt/homebrew/bin:$PATH"

PATH="~/.local/bin/:$PATH"

# Show Github Branch (later use for PS1)
autoload -U colors && colors
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
# Configure Command Prompt (PS1)
setopt PROMPT_SUBST
PROMPT='%F{#00ffff}%n%f@%F{yellow3}%m%f %F{blue}%B%~%b%f %b%F{39}$(parse_git_branch) %f%# '

setopt AUTO_CD
export EDITOR='nvim'



#vi mode
bindkey -v
export KEYTIMEOUT=1


# Alias to common commands
alias la="ls -la --color"
alias ls="ls --color"
alias grep='grep --color=auto'
alias e="emacs"
alias v="vim"
alias vim="nvim"
alias lt="cp ~/.local/templates/article.tex ./text.tex"
alias yta3="yt-dlp -x --audio-format mp3 --audio-quality 0"
alias ytab="yt-dlp -x -f bestaudio/best"
alias yt="yt-dlp"

