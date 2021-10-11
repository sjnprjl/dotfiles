#!/usr/bin/bash
##                _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Fri Aug 20 08:37:36 PM +0545 2021
## Books collection scraper maybe
if [[ ! -f "/bin/dmenu" ]]; then 
    notify-send "You need dmenu for this script to work"
    echo "Need dmenu."
    exit 0
fi
if [[ ! -f "/bin/zathura" ]]; then 
    notify-send "You need zathura document viewer."
    echo "Zathura needed. Install the package"
    exit 0
fi
DIR=$HOME/.books
if [[ ! -d $DIR ]]; then 
    echo "Please create a directory $DIR"
    exit
fi

hmm=$(ls $DIR | dmenu -l 10 -p "List of Books Maybe " -i)
if [[ ! -z $hmm ]]; then 
    zathura "$DIR/$hmm"
fi


