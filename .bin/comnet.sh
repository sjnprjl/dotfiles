#!/usr/bin/bash
##            _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Sun Oct 10 01:33:50 PM +0545 2021
## SIMPLE SCRIPT TO RUN comnet III on linux
already_runnig=$(pgrep wine)
comnet_dir="~/.wine/drive_c/Program\ Files\ \(x86\)/COMNET\ III/data"
executable="comnet.exe"
if [[ $already_runnig ]]; then 
    notify-send "Comnet is already running."
    exit
fi
cd $comnet_dir
sudo sysctl -q -w vm.mmap_min_addr=0       
wine $executable 
exit




