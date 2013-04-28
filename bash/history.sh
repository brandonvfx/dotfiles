# append to bash_history if Terminal.app quits
shopt -s histappend

# history handling
#

# resize history size
export HISTSIZE=50000


function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -n20
}