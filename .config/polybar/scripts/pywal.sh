#!/usr/bin/env bash
STYLE="$1"
PFILE="$HOME/.config/polybar/$STYLE/colors.ini"
RFILE="$HOME/.config/rofi/launchers/colorful/colors.rasi"

# Get colors
pywal_get() {
	wal -i "$1" -q
}

hex_to_rgb() {
    # Convert a hex value WITHOUT the hashtag (#)
    R=$(printf "%d" 0x${1:0:2})
    G=$(printf "%d" 0x${1:2:2})
    B=$(printf "%d" 0x${1:4:2})
}

ca() {
    color_adjust hex ${1:1} -${2} $3
}

get_fg_color(){
    INTENSITY=$(calc "$R*0.299 + $G*0.587 + $B*0.114")
    
    if [ $(echo "$INTENSITY>186" | bc) -eq 1 ]; then
        MF="#202020"
    else
        MF="#F5F5F5"
    fi
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/backgroud = .*/background = $BG/g" $PFILE
	sed -i -e "s/backgroud-alt = .*/background-alt = $BGA/g" $PFILE

	sed -i -e "s/BG = .*/BG = $BG/g" $PFILE
	sed -i -e "s/BG1 = .*/BG1 = $BG1/g" $PFILE
	sed -i -e "s/BG2 = .*/BG2 = $BG2/g" $PFILE
	sed -i -e "s/BG3 = .*/BG3 = $BG3/g" $PFILE
	sed -i -e "s/BG4 = .*/BG4 = $BG4/g" $PFILE
	sed -i -e "s/BGL = .*/BGL = $BGL/g" $PFILE
	sed -i -e "s/BGA = .*/BGA = $BGA/g" $PFILE

	sed -i -e "s/FG = .*/FG = $FG/g" $PFILE
	sed -i -e "s/foreground = .*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = .*/foreground-alt = $FGA/g" $PFILE

	sed -i -e "s/AC = .*/AC = $AC/g" $PFILE

	sed -i -e "s/red = .*/red = $RED/g" $PFILE
	sed -i -e "s/RED = .*/RED = $RED/g" $PFILE
	sed -i -e "s/GREEN = .*/GREEN = $GREEN/g" $PFILE
	sed -i -e "s/YELLOW = .*/YELLOW = $YELLOW/g" $PFILE
	sed -i -e "s/BLUE = .*/BLUE = $BLUE/g" $PFILE
	sed -i -e "s/PURPLE = .*/PURPLE = $PURPLE/g" $PFILE
	sed -i -e "s/CYAN = .*/CYAN = $CYAN/g" $PFILE
	sed -i -e "s/TEAL = .*/TEAL = $TEAL/g" $PFILE
	sed -i -e "s/AMBER = .*/AMBER = $AMBER/g" $PFILE
	sed -i -e "s/ORANGE = .*/ORANGE = $ORANGE/g" $PFILE
	sed -i -e "s/BROWN = .*/BROWN = $BROWN/g" $PFILE
	sed -i -e "s/GRAY = .*/GRAY = $GRAY/g" $PFILE
	sed -i -e "s/BLUEGRAY = .*/BLUEGRAY = $BLUEGRAY/g" $PFILE
	sed -i -e "s/PINK = .*/PINK = $PINK/g" $PFILE
	sed -i -e "s/LIME = .*/LIME = $LIME/g" $PFILE
	sed -i -e "s/INDIGO = .*/INDIGO = $INDIGO/g" $PFILE
	sed -i -e "s/green = .*/green = $GREEN/g" $PFILE
	sed -i -e "s/yellow = .*/yellow = $YELLOW/g" $PFILE
	sed -i -e "s/blue = .*/blue = $BLUE/g" $PFILE
	sed -i -e "s/purple = .*/purple = $PURPLE/g" $PFILE
	sed -i -e "s/cyan = .*/cyan = $CYAN/g" $PFILE
	sed -i -e "s/teal = .*/teal = $TEAL/g" $PFILE
	sed -i -e "s/amber = .*/amber = $AMBER/g" $PFILE
	sed -i -e "s/orange = .*/orange = $ORANGE/g" $PFILE
	sed -i -e "s/brown = .*/brown = $BROWN/g" $PFILE
	sed -i -e "s/gray = .*/gray = $GRAY/g" $PFILE
	sed -i -e "s/blue-gray = .*/blue-gray = $BLUEGRAY/g" $PFILE
	sed -i -e "s/pink = .*/pink = $PINK/g" $PFILE
	sed -i -e "s/lime = .*/lime = $LIME/g" $PFILE
	sed -i -e "s/indigo = .*/indigo = $INDIGO/g" $PFILE

	sed -i -e "s/sep = .*/sep = $SEP/g" $PFILE

	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
	# rofi
      #se:   ${SE}40;
	  #bg1:   ${SH2}FF;
	  #bg2:   ${SH3}FF;
	  #bg3:   ${SH4}FF;
    ac=$( if [[ $AC ]]; then echo $AC; else echo "#FFFFFF"; fi )
    fgr=$( if [[ $FG ]]; then echo $(color_adjust hex ${FG:1} -l 10000); else echo "#FFFFFF"; fi )
    se=$( if [[ $SE ]]; then echo $SE; else echo "#ABCDEF"; fi )
    bg1=$( if [[ $SH2 ]]; then echo $SH2; else echo "#ABCDEF"; fi )
    bg2=$( if [[ $SH3 ]]; then echo $SH3; else echo "#ABCDEF"; fi )
    bg3=$( if [[ $SH4 ]]; then echo $SH4; else echo "#ABCDEF"; fi )
	cat > $RFILE <<- EOF
	/* colors */

	* {
        al:   #00000000;
        bg:   ${BG}FF;
        fg:   ${fgr}FF;
        ac:   ${ac}FF;
        se:   ${se}40;
        bg1:  ${bg1}FF;
        bg2:  ${bg2}FF;
        bg3:  ${bg3}FF;
  }
	EOF
	polybar-msg cmd restart
    
}

color_manhatten() {
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
}
color_nordic() {
    SE=`printf "%s\n" "$color12"`
    BG=`printf "%s\n" "$background"`
    #BGL=`printf "%s\n" "${background}"`
    BGL=`printf "%s\n" "$(color_adjust hex ${background:1} -l 80)"`
   BGA=`printf "%s\n" "$color15"`
    FG=`printf "%s\n" "$foreground"`
    FGA=`printf "%s\n" "$foreground"`
    AC=`printf "%s\n" "$color3"`
    RED=`printf "%s\n" "$color11"`
    BLUE=`printf "%s\n" "$color2"`
    GREEN=`printf "%s\n" "$color5"`
    PURPLE=`printf "%s\n" "$color10"`
    CYAN=`printf "%s\n" "$color4"`
    TEAL=`printf "%s\n" "$color9"`
    AMBER=`printf "%s\n" "$color2"`
    ORANGE=`printf "%s\n" "$color6"`
    BROWN=`printf "%s\n" "$color9"`
    GRAY=`printf "%s\n" "$color8"`
    BLUEGRAY=`printf "%s\n" "$color11"`
    PINK=`printf "%s\n" "$color1"`
    LIME=`printf "%s\n" "$color14"`
    INDIGO=`printf "%s\n" "$color5"`
    YELLOW=`printf "%s\n" "$color3"`
}
color_beach() {
    BG=`printf "%s\n" "$background"`
    BGA=`printf "%s\n" "$color2"`
    FG=`printf "%s\n" "$foreground"`
    SE=`printf "%s\n" "$foreground"`
    AC=`printf "%s\n" "$color3"`
    DARK=`printf "%s\n" "$color3"`
    LIGHT=`printf "%s\n" "$color6"`
    RED=`printf "%s\n" "$color5"`
    BLUE=`printf "%s\n" "$color2"`
    GREEN=`printf "%s\n" "$color5"`
    PURPLE=`printf "%s\n" "$color10"`
    CYAN=`printf "%s\n" "$color4"`
    LIME=`printf "%s\n" "$color14"`
    YELLOW=`printf "%s\n" "$color3"`
}
color_spark() {
    BG=`printf "%s\n" "$background"`
    BGA=`printf "%s\n" "$(ca $color2 l 50 )"`
    FG=`printf "%s\n" "$foreground"`
    FGA=`printf "%s\n" "$foreground"`
    AC=`printf "%s\n" "$color3"`
    SE=`printf "%s\n" "$color12"`
    RED=`printf "%s\n" "$color11"`
    BLUE=`printf "%s\n" "$color2"`
    GREEN=`printf "%s\n" "$color5"`
    PURPLE=`printf "%s\n" "$color10"`
    CYAN=`printf "%s\n" "$color4"`
    YELLOW=`printf "%s\n" "$(color_adjust hex ${color2:1} -l 20)"`
}
color_wave() {
    BG=`printf "%s\n" "$color0"`
    BG1=`printf "%s\n" "$color0"`
    BG2=`printf "%s\n" "$color0"`
    BG3=`printf "%s\n" "$color0"`
    BG4=`printf "%s\n" "$color0"`
    BGA=`printf "%s\n" "$color0"`
    FG=`printf "%s\n" "$foreground"`
    AC=`printf "%s\n" "$color2"`
    SE=`printf "%s\n" "$color12"`
    RED=`printf "%s\n" "$color6"`
    YELLOW=`printf "%s\n" "$color15"`
    BLUE=`printf "%s\n" "$color15"`
    GREEN=`printf "%s\n" "$color7"`
    PURPLE=`printf "%s\n" "$color7"`
    CYAN=`printf "%s\n" "$color15"`
}
color_forest() {
    BG=`printf "%s\n" "$color0"`
    FG=`printf "%s\n" "$foreground"`
    SP=`printf "%s\n" "$color8"`
    RED=`printf "%s\n" "$color6"`
    YELLOW=`printf "%s\n" "$color15"`
    BLUE=`printf "%s\n" "$color15"`
    GREEN=`printf "%s\n" "$color7"`
    PURPLE=`printf "%s\n" "$color7"`
    CYAN=`printf "%s\n" "$color15"`
    TEAL=`printf "%s\n" "$color9"`
    AMBER=`printf "%s\n" "$color2"`
    ORANGE=`printf "%s\n" "$color6"`
    BROWN=`printf "%s\n" "$color9"`
    GRAY=`printf "%s\n" "$color8"`
    BLUEGRAY=`printf "%s\n" "$color11"`
    PINK=`printf "%s\n" "$color13"`
    LIME=`printf "%s\n" "$color14"`
    INDIGO=`printf "%s\n" "$color5"`
    YELLOW=`printf "%s\n" "$color3"`
    AC=`printf "%s\n" "$color2"`
    SE=`printf "%s\n" "$color12"`
}
color_colorblocks() {
    BG=`printf "%s\n" "$background"`
    FG=`printf "%s\n" "$color0"`
    FGA=`printf "%s\n" "$color7"`
    SH1=`printf "%s\n" "$color1"`
    SH2=`printf "%s\n" "$color2"`
    SH3=`printf "%s\n" "$color1"`
    SH4=`printf "%s\n" "$color2"`
    SH5=`printf "%s\n" "$color1"`
    SH6=`printf "%s\n" "$color2"`
    SH7=`printf "%s\n" "$color1"`
    SH8=`printf "%s\n" "$color2"`

}
color_blocks() {
    BG=`printf "%s\n" "$color0"`
    BGA=`printf "%s\n" "$background"`
    hex_to_rgb ${color7:1}
    get_fg_color
    #FG=`printf "%s\n" "$color0"`
    FG=`printf "%s\n" "$MF"`
    FGA=`printf "%s\n" "$color5"`
    RED=`printf "%s\n" "$color5"`
    YELLOW=`printf "%s\n" "$color5"`
    BLUE=`printf "%s\n" "$color5"`
    GREEN=`printf "%s\n" "$color5"`
    PURPLE=`printf "%s\n" "$color5"`
    CYAN=`printf "%s\n" "$color5"`
    TEAL=`printf "%s\n" "$color5"`
    AMBER=`printf "%s\n" "$color5"`
    ORANGE=`printf "%s\n" "$color11"`
    BROWN=`printf "%s\n" "$color5"`
    GRAY=`printf "%s\n" "$color13"`
    BLUEGRAY=`printf "%s\n" "$color11"`
    PINK=`printf "%s\n" "$color5"`
    LIME=`printf "%s\n" "$color5"`
    INDIGO=`printf "%s\n" "$color5"`
    YELLOW=`printf "%s\n" "$color5"`
    AC=`printf "%s\n" "$color2"`
    SE=`printf "%s\n" "$color12"`

}
color_cuts() {
    bash $HOME/.config/polybar/cuts/scripts/pywal.sh $1
}
color_docky() {
    bash $HOME/.config/polybar/docky/scripts/pywal.sh $1
}
color_grayblocks() {
    bash $HOME/.config/polybar/grayblocks/scripts/pywal.sh $1
}
color_hack() {
    bash $HOME/.config/polybar/hack/scripts/pywal.sh $1
}
color_material() {
    bash $HOME/.config/polybar/material/scripts/pywal.sh $1
}
color_shapes() {
    bash $HOME/.config/polybar/shapes/scripts/pywal.sh $1
}
color_shades() {
    bash $HOME/.config/polybar/shades/scripts/pywal.sh $1
}


# Main
if [[ -f "/usr/bin/wal" ]]; then
	if [[ "$2" ]]; then
		pywal_get "$2"
		# Source the pywal color file

    . "$HOME/.cache/wal/colors.sh"
        case $STYLE in
            wave)
                color_wave
                change_color
                ;;
            spark)
                color_spark
                change_color
                ;;
            manhattan)
                color_manhatten
                change_color
                ;;
            nordic)
                color_nordic
                change_color
                ;;
            beach)
                color_beach
                change_color
                ;;
            colorblocks)
                color_colorblocks
                change_color
                ;;
            cuts)
                color_cuts $2
                ;;
            docky)
                color_docky $2
                ;;
            material)
                color_material $2
                ;;
            grayblocks)
                color_grayblocks $2
                ;;
            shades)
                color_shades $2
                ;;
           shapes)
               color_shapes $2
                ;;
           hack)
               color_hack $2
                ;;
           forest)
               color_forest
               change_color
                ;;
           blocks)
               color_blocks
               change_color
                ;;
        esac
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi

