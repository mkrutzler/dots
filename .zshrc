#!/bin/bash
PATH="/Users/markkrutzler/Library/Python/3.9/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="/Users/markkrutzler/.local/bin/:$PATH"

# Github Branch shower type shit and prompt and colors
autoload -U colors && colors
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL
export EDITOR='vim'
export REFER='~/.config/bibliography'
PROMPT='%F{#00ffff}%n%f@%F{yellow3}%m%f %F{blue}%B%~%b%f %# '


#vi mode
bindkey -v
export KEYTIMEOUT=1


# Alias to common commands
#
alias school="cd /Users/markkrutzler/Library/Mobile\ Documents/com~apple~CloudDocs/sync/school"
alias cdsync="cd /Users/markkrutzler/Library/Mobile\ Documents/com~apple~CloudDocs/sync"
alias o="open"
alias orgs="cd /Users/markkrutzler/Library/Mobile\ Documents/com~apple~CloudDocs/sync/school/f2023 && emacs f2023.org"
alias la="ls -la --color"
alias ls="ls --color"
alias e="emacs"
alias v="vim"
alias lt="cp ~/.local/templates/article.tex ./text.tex"
alias yta3="yt-dlp -x --audio-format mp3 --audio-quality 0"
alias ytab="yt-dlp -x -f bestaudio/best"
alias yt="yt-dlp"

# Load zsh-syntax plugin highlifhting should be last
source /Users/markkrutzler/Git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
