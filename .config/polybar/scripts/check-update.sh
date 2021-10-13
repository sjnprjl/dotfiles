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

avail=$(checkupdates | wc -l)

low=20
critical=100
peak=200
msg=""

icon=""

hex=$GREEN

if ((  $avail >= $peak )); then
    hex=$RED
    icon=""
    msg="Please update your system:("
elif (( $avail >= $critical )); then 
    hex=$YELLOW
    icon=""
    msg="Maintain your system:/"
fi

color="%{F$hex}"
echo "$color $icon $avail updates available%{F-}"
if (( $avail >= $critical )); then 
    notify-send -t 10000 -u critical "UPDATE!!!" "$msg"
fi



