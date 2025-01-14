# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac




# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

source ~/.bash_colors
source ~/.bash_aliases


###################################################
echo "$GREEN Hallo ! =)$CLOSE"
echo


printf '%*s\n' "${COLUMNS}" '' | tr ' ' -
echo "$CYAN[LOCAL]$CLOSE"
echo "$BLUE > OS: $CLOSE$(cat /etc/os-release | grep -v "UBUNTU" | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')"
echo "$BLUE > Rechner:$CLOSE $HOSTNAME" 
echo "$BLUE > In betrieb:$CLOSE $(uptime -p)"
echo "$BLUE > Speicherplatz Root:$CLOSE $(df -hT '/' | grep '/' | awk '{print $5}') frei ($(df -hT / | grep / | awk '{print $6}') benutzt)$CLOSE"
echo "$BLUE > Speicherplatz Home:$CLOSE $(df -hT '/home' | grep '/home' | awk '{print $5}') frei ($(df -hT / | grep / | awk '{print $6}') benutzt)$CLOSE"
printf '%*s\n' "${COLUMNS}" '' | tr ' ' -
#echo
#echo "$CYAN[DEVICES]$CLOSE"
#echo "$BLUE > Über USB angeschlossen:$CLOSE $(ls /media/teamcons/)"
#if [[$(lsusb | grep thethering)]]; then echo "$BLUE > Tethering:$CLOSE";fi



	#REMOTE PANEL
#	echo "$CYAN[REMOTE]$CLOSE"
#	if ip r >> /dev/null
#	then echo "$BLUE > Internet:$CLOSE Verbunden" 
#	else echo "$BLUE > Internet:$RED GETRENNT$CLOSE" 
#	fi
#
#	#BACKUP DRIVE
#	if [ -e /media/stella/STOREIT/ ]
#	then echo "$BLUE > Backup drive:$CLOSE Verbunden"
#	else echo "$BLUE > Backup drive:$RED GETRENNT$CLOSE"
#	fi
#	echo


###################################################

#$?\n
		PS1="\[\n\]\[$GREEN\] \[$HOSTNAME\]\[$BLUE\]\$PWD\n \[${YELLOW}\]-->\[$STOP\] "

###################################################

# If inside toolbox different PS1
#if [[ "$(hostname)" == "toolbox" ]]
#	then
#		# enclose nonprintable in \[ and \] to avoid display bug
#		PS1="\[\n\]\[$YELLOW\] \[📦TOOLBOX\]\[$BLUE\]\$PWD\n \[${YELLOW}\]-->\[$STOP\] "

#	#Normal prompt
#	else
#		# enclose nonprintable in \[ and \] to avoid display bug
#		PS1="\[\n\]\[$GREEN\] \[$HOSTNAME\]\[$BLUE\]\$PWD\n \[${YELLOW}\]-->\[$STOP\] "
#fi

###################################################

#JUNK
#esptool.py --port /dev/ttyUSB0 write_flash -fm dio 0x00000 ./nodemcu-master-10-modules-2018-08-08-21-06-38-integer.bin 
#alias esp="picocom --baud 115200 /dev/ttyUSB0"
#export PATH="$PATH:/opt/The Whitecat Create Agent"
#alias meta="ydotool key 125:1 125:0"
#alias chirp='notify-send "Birb" "Chirp chirp chirp" -i /var/home/teamcons/chirp.png'

### GITHUB
function gi()
{
	git init
	git remote add origin "$1".git
	git add *
	git commit -m "First commit"
	git push --set-upstream origin main
}

function gu()
{
	git add -A *
	git commit -m "${*:-"Small changes here and there"}"
	git push -f -u origin main
}

function gr()
{
 git fetch origin
 git reset --hard origin/main
git clean -ffxd
}




#zenity --list --checklist --column=what --column="where" $(cat /var/home/teamcons/.config/gtk-3.0/bookmarks | tr '\n' ' ') --separator="\n"


alias whitesur="./install.sh -l -c Light --round --shell -i simple -t" 
#override GTK_THEME=WhiteSur-Light-green
# ICON_THEME=bloom-classic-fixed
#export GTK_THEME=Yaru

alias preparethis="meson build prefix=/usr; cd build; ninja; sudo ninja install"
alias ,pt="preparethis"
alias sni="sudo ninja install"

alias flatbuild="flatpak-builder --force-clean --user --install-deps-from=appcenter --repo=repo --install builddir"
