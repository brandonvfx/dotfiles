
# LS Tools
if [ "$OS" == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -alFh'
alias llt='ls -alFrth'

# grep
alias grep="grep --color=auto"

# editors
function emacs()
{ 
    if [ "$OS" == "Darwin" ] ; then
        #command open -a /Applications/Emacs.app "$@"
        command emacs -nw "$@"
    else
        command emacs "$@" &
    fi
}

alias e=mate
alias m=mate

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
        echo "Grepping for processes matching $1..."
        history | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi 
}