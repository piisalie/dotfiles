alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias e="emacs -nw"

alias ga="git add"
alias gaa="git add -A"
alias gs="git status"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gpso="git push origin master"

alias be="bundle exec"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
