bind "set completion-ignore-case on"


# remap caps to ctrl
dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`

if [ "$dist" == "Ubuntu" ]; then
  setxkbmap -option caps:ctrl_modifier
fi
