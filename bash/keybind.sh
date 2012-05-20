
if [ "$OS" != "Darwin" ]; then
    xmodmap -e "remove Lock = Caps_Lock"
    xmodmap -e "keysym Caps_Lock = Control_L"
fi 