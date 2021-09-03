#!/usr/bin/bash
##                _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Fri Aug  6 07:13:20 PM +0545 2021
## A little font preview tool
## Dependency (imagemagick | display)
list=$(fc-list | grep ttf | cut -d: -f1 | shuf | dmenu -i -l 30 -p "Font Preview")
if [[ $list ]]; then 
    display $list
else 
    notify-send "No font selected!!"
fi
