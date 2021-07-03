#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/manhattan/colors.ini"
RFILE="$HOME/.config/polybar/manhattan/scripts/rofi/colors.rasi"

# Get colors
pywal_get() {
	wal -i "$1" -q -t
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/BG = #.*/BG = $BG/g" $PFILE
	sed -i -e "s/FG = #.*/FG = $FG/g" $PFILE
	sed -i -e "s/BGA = #.*/BGA = $BGA/g" $PFILE
	sed -i -e "s/AC = #.*/AC = $AC/g" $PFILE
	sed -i -e "s/RED = #.*/RED = $RED/g" $PFILE
	sed -i -e "s/GREEN = #.*/GREEN = $GREEN/g" $PFILE
	sed -i -e "s/YELLOW = #.*/YELLOW = $YELLOW/g" $PFILE
	sed -i -e "s/BLUE = #.*/BLUE = $BLUE/g" $PFILE
	sed -i -e "s/PURPLE = #.*/PURPLE = $PURPLE/g" $PFILE
	sed -i -e "s/CYAN = #.*/CYAN = $CYAN/g" $PFILE

	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:   #00000000;
	  bg:   ${BG}FF;
	  bga:  ${BGA}FF;
	  fg:   ${FG}FF;
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
		BGA=`printf "%s\n" "$color0"`
		FG=`printf "%s\n" "$foreground"`
		FGA=`printf "%s\n" "$foreground"`
		AC=`printf "%s\n" "$color3"`
		SE=`printf "%s\n" "$color12"`
		RED=`printf "%s\n" "$color11"`
		BLUE=`printf "%s\n" "$color2"`
		GREEN=`printf "%s\n" "$color5"`
		PURPLE=`printf "%s\n" "$color10"`
		CYAN=`printf "%s\n" "$color4"`


		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
