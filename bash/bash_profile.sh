# Default Files.
. ${HOME}/.dotfiles/bash/settings.sh
. ${HOME}/.dotfiles/bash/variables.sh
. ${HOME}/.dotfiles/bash/history.sh
. ${HOME}/.dotfiles/bash/aliases.sh

# Per host
if [ -f ${HOME}/.dotfiles_custom/${HOSTNAME}.sh ]; then
  . ${HOME}/.dotfiles_custom/${HOSTNAME}.sh
fi

# Per User
if [ -f ${HOME}/.dotfiles_custom/${USER}.sh ]; then
  . ${HOME}/.dotfiles_custom/${USER}.sh
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  . /usr/local/bin/virtualenvwrapper.sh
fi

if [ "$OS" == "Darwin" ] ; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
else
  if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function _update_ps1() {
  export PS1="$(~/.dotfiles/powerline_shell/powerline-shell.py $?)"
}

export PROMPT_COMMAND="_update_ps1"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
