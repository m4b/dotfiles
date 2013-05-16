
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls -F --color=auto'
alias l='ls -al --color=auto'
alias grep="grep --color=auto"              # colourized grep
alias egrep="egrep --color=auto"            # colourized egrep
alias emacs='emacs --no-splash --fullscreen'


EDITOR=emacs
export EDITOR

export PATH="$PATH:$HOME/bin/:$HOME/.cabal/bin"

# LESS man page colors -------------------------------------------------

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# linux console colors (ala phrak) -------------------------------------

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P8555753" #darkgrey
    echo -en "\e]P1ff6565" #darkred
    echo -en "\e]P9ff8d8d" #red
    echo -en "\e]P293d44f" #darkgreen
    echo -en "\e]PAc8e7a8" #green
    echo -en "\e]P3eab93d" #brown
    echo -en "\e]PBffc123" #yellow
    echo -en "\e]P4204a87" #darkblue
    echo -en "\e]PC3465a4" #blue
    echo -en "\e]P5ce5c00" #darkmagenta
    echo -en "\e]PDf57900" #magenta
    echo -en "\e]P689b6e2" #darkcyan
    echo -en "\e]PE46a4ff" #cyan
    echo -en "\e]P7cccccc" #lightgrey
    echo -en "\e]PFffffff" #white
    clear # bring us back to default input colours
fi


PS1="\[\e[0;31m\]\u\[\e[m\]\[\033[34m\] :: \[\e[m\]\[\e[1;34m\] [ \[\033[00m\]\w\[\e[1;34m\] ]\[\e[m\]\[\033[00m\] "
PS2="\[\033[32m\]_\[\033[32m\]\[\033[34m\] ->\[\033[34m\]\[\033[00m\] "


#fancy root prompt
#PS1="\[\033[31m\]\[\033[34m\](\[\033[31m\]\u\[\033[34m\]@\[\033[31m\]\h\
#\[\033[34m\])\[\033[31m\]-\[\033[34m\](\[\033[31m\]\$(date +%I:%M%P)\
#\[\033[34m\]-:-\[\033[31m\]\$(date +%m)\[\033[34m\033[31m\]/\$(date +%d)\
#\[\033[34m\])\[\033[31m\]-\[\033[34m\]»\[\033[31m\]-\
#\[\033[34m\]\n\[\033[31m\]\[\033[34m\](\[\033[31m\]\w\[\033[34m\])\
#\[\033[31m\]\[\033[34m\]\[\033[00m\] "
#PS2="> "

myfortune=$(fortune)
#echo $myfortune >> $HOME/misc/fortunes.txt
echo $myfortune

