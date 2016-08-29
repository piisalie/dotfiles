alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ga="git add"
alias gaa="git add -A"
alias gs="git status"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gpso="git push origin master"
alias glr=" git --no-pager log --graph --abbrev-commit --date=relative -10 --all --pretty='tformat:%C(yellow)%h%Creset -%C(red)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias gco="git checkout"

alias be="bundle exec"
alias ber="bundle exec rake"
alias bc="bundle console"
alias rt="ber -T"
alias fs="be foreman start"

alias e="ec -n -nw"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias nvid-status='cat /proc/acpi/bbswitch'
alias nvid-off='sudo tee /proc/acpi/bbswitch <<<OFF'
alias nvid-on='sudo tee /proc/acpi/bbswitch <<<ON'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi