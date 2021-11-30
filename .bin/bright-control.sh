#!/usr/bin/bash
##                _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Fri Oct 22 10:19:50 AM +0545 2021


send_noti() {
    icon="$HOME/icons/brightness/brightness.png"
    brightness=$(xbacklight -get)
    dunstify -i "$icon" -r 5555 -u normal "Brightness ${brightness%.*}%"
}

case $1 in 
    up)
        xbacklight -inc $2
        send_noti
        ;;
    down)
        xbacklight -dec $2
        send_noti
        ;;
esac

