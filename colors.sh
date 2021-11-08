#!/usr/bin/bash
##                _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Sat Aug  7 10:50:01 AM +0545 2021
## Small scripts to extract colors from Xresources
## This can be used in any programs for configuration
getcolors () {
	FOREGROUND=$(xrdb -query | grep 'foreground:'| awk '{print $NF}')
	BACKGROUND=$(xrdb -query | grep 'background:'| awk '{print $NF}')
	BLACK=$(xrdb -query | grep 'color0:'| awk '{print $NF}')
	RED=$(xrdb -query | grep 'color1:'| awk '{print $NF}')
	GREEN=$(xrdb -query | grep 'color2:'| awk '{print $NF}')
	YELLOW=$(xrdb -query | grep 'color3:'| awk '{print $NF}')
	BLUE=$(xrdb -query | grep 'color4:'| awk '{print $NF}')
	MAGENTA=$(xrdb -query | grep 'color5:'| awk '{print $NF}')
	CYAN=$(xrdb -query | grep 'color6:'| awk '{print $NF}')
	WHITE=$(xrdb -query | grep 'color7:'| awk '{print $NF}')
	c8=$(xrdb -query | grep 'color8:'| awk '{print $NF}')
	c9=$(xrdb -query | grep 'color9:'| awk '{print $NF}')
	c10=$(xrdb -query | grep 'color10:'| awk '{print $NF}')
	c11=$(xrdb -query | grep 'color11:'| awk '{print $NF}')
	c12=$(xrdb -query | grep 'color12:'| awk '{print $NF}')
	c13=$(xrdb -query | grep 'color13:'| awk '{print $NF}')
	c14=$(xrdb -query | grep 'color14:'| awk '{print $NF}')
	c15=$(xrdb -query | grep 'color15:'| awk '{print $NF}')
}
getcolors


