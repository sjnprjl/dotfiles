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
#sudo sysctl -w vm.mmap_min_addr=0       
pkill wine
cd $HOME/.wine/vodka/drive_c/Program\ Files/COMNET\ III
env WINEARCH=win32 WINEPREFIX=~/.wine/vodka wine comnet.exe




