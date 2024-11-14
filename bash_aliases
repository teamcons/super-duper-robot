

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi




### CONFORT ###
alias ls='ls --group-directories-first --color=auto --hyperlink=auto --sort=time'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias la='ll -a'
alias l='ll -d .*'

alias cp="cp -vRi"
alias du='du -h'
alias rm='rm -vri'
alias mkdir='mkdir -v'
alias mv='mv -v'
alias chmod='chmod -v'
alias free="free -mh"
alias df='df -h'


### COMMANDES CUSTOM ###
alias rf='clear && source ~/.bashrc'
alias e='exit'
alias x="chmod +x"
alias sn='sudo nano'

alias e=exit
alias o=xdg-open


alias mediacenter="ssh -v -X 192.168.0.204"


alias asremote="git fetch origin ; git reset --hard origin/main ; git clean -df ; git pull"



### SYSTEM


alias fin="flatpak install --system --or-update -y"
alias fr="flatpak remove"

alias saa="sudo apt autoremove"
alias sai="sudo apt install"

alias files="io.elementary.files --new-window"

