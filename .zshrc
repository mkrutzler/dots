#!/bin/bash

# Add Binaries to PATH
PATH="/Users/markkrutzler/Library/Python/3.9/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="/Users/markkrutzler/.local/bin/:$PATH"

# Show Github Branch (later use for PS1)
autoload -U colors && colors
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
# Configure Command Prompt (PS1)
setopt PROMPT_SUBST
PROMPT='%F{#00ffff}%n%f@%F{yellow3}%m%f %F{blue}%B%~%b%f %b%F{39}$(parse_git_branch) %f%# '

setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL
export EDITOR='vim'
export REFER='~/.config/bibliography'



#vi mode
bindkey -v
export KEYTIMEOUT=1


# Alias to common commands
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
