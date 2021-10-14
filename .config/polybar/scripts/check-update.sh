#!/usr/bin/bash
##                _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Thu Oct 14 01:12:57 AM +0545 2021

source ~/colors.sh

avail=$(checkupdates 2>/dev/null | wc -l)

low=20
critical=100
peak=200
msg=""

icon="﯑"

#icon=""

hex=$WHITE
icon_hex=$c15

if ((  $avail >= $peak )); then
    hex=$RED
    #icon=""
    msg="Please update your system:("
elif (( $avail >= $critical )); then 
    hex=$YELLOW
    icon=""
    #icon=""
    msg="Maintain your system:/"
fi

color="%{F$hex}"
icon_color="%{F$icon_hex}"
end="%{F-}"
echo "$icon_color $icon $end$color$avail updates available$end"
if (( $avail >= $critical )); then 
    notify-send -t 10000 -u critical "UPDATE!!!" "$msg"
fi



