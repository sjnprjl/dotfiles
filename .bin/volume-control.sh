#!/usr/bin/bash
##                _  _                   
##           (_)(_)                 
##  ___ _   _ _  _  __ _ _ __ __  __
## / __| | | | || |/ _` | '_ \\ \/ /
## \__ \ |_| | || | (_| | | | |>  < 
## |___/\__,_| || |\__,_|_| |_/_/\_\
##          _/ |/ |                 
##         |__/__/                  
## Fri Oct 22 01:40:16 PM +0545 2021

notify() {
    icon="~/icons/volume/volume-$1.png"
    summary="$2"
    dunstify -i "$icon" -r 9999 "$summary" 
}
get_volume() {
    awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | sed 's/%//'
}
is_mute() {
    amixer sget Master | grep '\[off\]'
}

display_noti() {
    icon=""
    current_volume=$(get_volume)
    summary="Volume $current_volume% "
    if [[ $(is_mute) ]]; then 
        icon="mute"
        summary="You have been muted."
    elif (( $current_volume <= 50 )); then 
        icon="low"
    else
        icon="full"
    fi
    notify $icon "$summary"

}

case $1 in 
    down)
        amixer set 'Master' "$2%-" unmute
        display_noti
        ;;
    up)
        amixer set 'Master' "$2%+" unmute
        display_noti
        ;;
    mute)
        amixer set 'Master' toggle;
        display_noti
        ;;
esac
