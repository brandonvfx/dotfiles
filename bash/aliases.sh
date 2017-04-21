
# LS Tools
if [ "$OS" == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -alFh'
alias llt='ls -alFrth'

# grep
alias grep='grep --color=auto '

# editors
function e()
{
    if [ "$OS" == "Darwin" ] ; then
        command open -a /Applications/Emacs.app "$@" --args "--debug-init --nw"
        #command emacs -nw "$@"
        #command /Applications/Emacs.app/Contents/MacOS/Emacs "$@"
    else
        command emacs "$@" &
    fi
}

#alias e=emacs
# alias m=mate

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias p='pushd'
alias o='popd'

# safety
alias rm='rm -i'

alias mkdir='mkdir -p'

alias serverdir="python -m SimpleHTTPServer 8000"
alias ping='ping -c 2'

pgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo "!! Need name to grep for"
	fi
}

hgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for history matching $1..."
        history | grep $1
    else
        echo "!! Need name to grep for"
    fi
}

if [ -x /usr/local/bin/hub ] || [ -x ~/bin/hub ]
then
    alias git=hub
fi

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# docker
alias compose='docker-compose'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcr='docker-compose run'
alias dcb='docker-compose build'
# alias machine='docker-machine'
# alias m='docker-machine'
# machine-set () { eval "$(docker-machine env $*)" ;}
alias dock='docker'
alias d='docker'
