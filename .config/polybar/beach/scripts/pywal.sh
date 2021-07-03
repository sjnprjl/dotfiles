#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/beach/colors.ini"
RFILE="$HOME/.config/polybar/beach/scripts/rofi/colors.rasi"

# Get colors
pywal_get() {
	wal -i "$1" -q -t -s
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/BG = #.*/BG = $BG/g" $PFILE
	sed -i -e "s/FG = #.*/FG = $FG/g" $PFILE
	sed -i -e "s/BGA = #.*/BGA = $BGA/g" $PFILE
	sed -i -e "s/AC = #.*/AC = $AC/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  fg:    ${FG}FF;
      bga:  ${BGA}FF;
      fga:  ${FGA}FF;
      ac:   ${AC}FF;
      se:   ${SE}40;
	}
	EOF
	
	polybar-msg cmd restart
}

# Main
if [[ -f "/usr/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		BGA=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$foreground"`
		FGA=`printf "%s\n" "$foreground"`
		AC=`printf "%s\n" "$color1"`
		SE=`printf "%s\n" "$color2"`

    if [[ $2 = "light" ]]; then
		BG=`printf "%s\n" "$color7"`
		BGA=`printf "%s\n" "$color15"`
		FG=`printf "%s\n" "$color0"`
		FGA=`printf "%s\n" "$background"`
		AC=`printf "%s\n" "$color14"`
		SE=`printf "%s\n" "$color2"`
        
    fi

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
