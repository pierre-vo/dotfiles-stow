# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
alias more=less
# alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -h --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias nano=emacs

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias viml="vim `ls -t | head -1`"
alias screenl="screen -dRR"
alias screens="screen -ls"
alias screenr="screen -r"
alias dspace="df -h"

alias vnc7="vncserver :1 -geometry 1280x720"
alias vnck="vncserver -kill :1"

alias off="sudo shutdown -h now"

alias yd="youtube-dl -f 45"

alias wlanscan="sudo iwlist wlan0 scan"

alias logSSHAuth="sudo grep sshd.*Failed /var/log/auth.log | less"
alias logSSHFail="sudo grep sshd.*Did /var/log/auth.log | less"

alias up="sudo aptitude update && sudo aptitude safe-upgrade"
alias sched="cat /sys/block/sda/queue/scheduler"
alias his="history >> ~/history.txt"
alias pss="ps -A | grep"

alias hyprestart="sudo service hyperion restart"

