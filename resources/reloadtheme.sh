#!/bin/bash 


# reload .Xresources 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


# liverelaodxrdb function (dwm)
xdotool key alt+Super_L+shift+F12