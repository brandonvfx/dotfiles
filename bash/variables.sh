export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\u@\h:\W\> "

export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/opt/mongo/bin:$PATH"

export OS=`uname`

if [ "$OS" == "Darwin" ] ; then
    export EDITOR='mate'
else
    export EDITOR='emacs'
fi

export SWDEVL_HOME=${HOME}/swdevl
    
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/swdevl/projects"