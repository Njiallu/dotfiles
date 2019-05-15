#!/bin/sh

RES=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
HEIGHT=$(echo $RES | sed -r 's/x.*//')
WIDTH=$(echo $RES | sed -r 's/.*x//')

COLORS=($(xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2))
FOREGROUND=($(xrdb -query | sed -n 's/.*foreground//p' | cut -f2))
BACKGROUND=($(xrdb -query | sed -n 's/.*background//p' | cut -f2))

DEFAULT_RADIUS=$(expr $(if [[ $HEIGHT -gt $WIDTH ]]; then echo $WIDTH; else echo $HEIGHT; fi) / 4)
DEFAULT_TEXT_SIZE=$(expr $DEFAULT_RADIUS / 8)
DEFAULT_ICON_SIZE=$(expr $DEFAULT_RADIUS / 4)
DEFAULT_TEXT_COLOR=$

# Color section
B='#00000000'  # blank
C='#ebdbb222'  # clear ish
G='#92837496'  # greyish
D='#fbf1c796'  # default
T='#ebdbb296'  # text
W='#fb493496'  # wrong
V='#b8bb2696'  # verifying

# Default section
DLT_INS_COL=$G
DLT_RNG_COL=$G
DLT_SEP_COL=$B
DLT_DEL_COL=$W
DLT_TXT_COL=$G

DLT_INS_SIZ="$DEFAULT_TEXT_SIZE"
DLT_RNG_SIZ="$DEFAULT_RADIUS"
DLT_TXT_SIZ="$DEFAULT_TEXT_SIZE"

DLT_DEL_STR=""
DLT_LCK_STR=""
DLT_NOT_STR="fail"

# Wrong section
WRG_INS_COL=$W
WRG_RNG_COL=$G
WRG_TXT_COL=$G

WRG_INS_SIZ=$DEFAULT_ICON_SIZE
WRG_TXT_SIZ=$DEFAULT_TEXT_SIZE

WRG_TXT_STR=""

# Verification section
VER_INS_COL=$G
VER_RNG_COL=$G
VER_TXT_COL=$G

VER_INS_SIZ=$DEFAULT_ICON_SIZE
VER_TXT_SIZ=$DEFAULT_TEXT_SIZE

VER_TXT_STR=""

# Keyboard layout section
KBD_LYT_COL=$DEFAULT_TEXT_COLOR
KBD_LYT_SIZ=$DEFAULT_TEXT_SIZE

# Date and time section
DTM_DAT_STR="%a, %m %B %Y"
DTM_DAT_SIZ=$DEFAULT_TEXT_SIZE
DTM_DAT_POS="x + w / 2 : y - $DTM_DAT_SIZ / 2 + h / 2"
DTM_DAT_FNT='DejaVuSansMono Nerd Font Mono'

DTM_TIM_STR="%H:%M"
DTM_TIM_SIZ=$DEFAULT_TEXT_SIZE
DTM_TIM_POS="x + w / 2 : y + $DTM_DAT_SIZ / 2 + h / 2"
DTM_TIM_FNT='DejaVuSansMono Nerd Font Mono'

# Various options
OPT_DLT_LYT=2
OPT_DLT_SCN=1
OPT_CLK_ENB=1
OPT_BLR_ENB=10
OPT_IND_ENB=1
OPT_IND_POS="x + w / 2 : y + h / 2"

convert_hex_to_rgb() {
	if [[ ${1:0:1} == "#" ]]; then
		echo $(printf "%d;%d;%d" 0x${1:1:2} 0x${1:3:2} 0x${1:5:2})
	else
		echo $(printf "%d;%d;%d" 0x${1:0:2} 0x${1:2:2} 0x${1:4:2})
	fi
}

print_is_enabled() {
	if [[ ! $1 ]]; then
		echo "\e[1;31mDisabled"
	else
		echo "\e[1;32mEnabled"
	fi
}

debug () {
	echo -e "\n\e[1;37mLocking with parameters:\e[0m\n"

	echo -e "\t- Screen resolution:\t\e[1;33m$HEIGHT""\e[0m\e[33mx\e[1;33m$WIDTH\e[0m\n"
	echo -e "\t- Indicator in idle:\t$(print_is_enabled $OPT_IND_ENB)\e[0m"
	echo -e "\t- Indicator position:\t\e[33m'\e[1;33m$OPT_IND_POS\e[0m\e[33m'\e[0m"
	echo -e "\t- Indicator diameter:\t\e[1;33m$(expr $(echo $DLT_RNG_SIZ) \* 2)\e[0m\e[33mpx\e[0m\n"

	echo -e "\t- Clock:\t\t\t\t$(print_is_enabled $OPT_CLK_ENB)\e[0m"
	echo -e "\t- Date:\t\t\t\t\t\e[1;33m$DTM_DAT_SIZ""\e[0m\e[33mpx '\e[1;33m$(echo $DTM_DAT_STR)\e[0m\e[33m'\e[0m"
	echo -e "\t- Date position:\t\t\e[33m'\e[1;33m$DTM_DAT_POS\e[0m\e[33m'\e[0m"
	echo -e "\t- Date font: \t\t\t\e[1;33m$DTM_DAT_FNT\e[0m\n"
	echo -e "\t- Time:\t\t\t\t\t\e[1;33m$DTM_TIM_SIZ""\e[0m\e[33mpx '\e[1;33m$(echo $DTM_TIM_STR)\e[0m\e[33m'\e[0m"
	echo -e "\t- Time position:\t\t\e[33m'\e[1;33m$DTM_TIM_POS\e[0m\e[33m'\e[0m"
	echo -e "\t- Time font: \t\t\t\e[1;33m$DTM_TIM_FNT\e[0m\n"

	echo -e "\t- Colors:"
	echo -e "\t\e[0mBlack      Red        Green      Yellow     Blue       Magenta    Cyan       White"
	echo -en "\t──────────────────────────────────────────────────────────────────────────────────────\e[0m\n\t"
	for i in {0..7}; do echo -en "\e[38;2;$(convert_hex_to_rgb ${COLORS[i]})m█ ${COLORS[i]}  \e[0m"; done
	echo -en "\n\t"
	for i in {8..15}; do echo -en "\e[38;2;$(convert_hex_to_rgb ${COLORS[i]})m█ ${COLORS[i]}  \e[0m"; done
	echo -e "\n"
}

lock () {
	i3lock \
		--insidewrongcolor=$B    \
		--ringwrongcolor=$W      \
		--wrongcolor=$T          \
		\
		--insidecolor=$B         \
		--ringcolor=$D           \
		--linecolor=$G           \
		--separatorcolor=$C      \
		--keyhlcolor=$T          \
		--bshlcolor=$G           \
		\
		--verifcolor=$T          \
		--insidevercolor=$B      \
		--ringvercolor=$V        \
		\
		--timecolor=$T           \
		--datecolor=$T           \
		--layoutcolor=$T         \
		--timestr="$DTM_TIM_STR"               \
		--datestr="$DTM_DAT_STR"               \
		--veriftext="$VER_TXT_STR"             \
		--wrongtext="$WRG_TXT_STR"             \
		--noinputtext="$DLT_DEL_STR"           \
		--locktext="$DLT_LCK_STR"              \
		--lockfailedtext="$DLT_NOT_STR"        \
		\
		--keylayout $OPT_DLT_LYT \
		--screen $OPT_DLT_SCN    \
		--blur $OPT_ENB_BLR      \
		--radius $DLT_RNG_SIZ    \
		$(if [[ $OPT_ENB_CLK ]]; then echo '--clock'; fi) \
		$(if [[ $OPT_ENB_IND ]]; then echo '--indicator'; fi) \
		\
		--time-font=$DTM_TIM_FNT  \
		--date-font=$DTM_DAT_FNT  \
		--verif-font='DejaVuSansMono Nerd Font Mono' \
		--wrong-font='DejaVuSansMono Nerd Font Mono' \
		\
		--timesize=$DTM_TIM_SIZ  \
		--datesize=$DTM_DAT_SIZ  \
		--verifsize=$VER_TXT_SIZ \
		--wrongsize=$WRG_TXT_SIZ \
		;
}

usage () {
	echo "Usage: $0 [-[s|h|l|d]]"
}

while getopts "ldD" o; do
	case "$o" in
		l)
			lock
			;;
		d)
			debug
			;;
		D)
			debug
			lock
			;;
		*)
			usage
			;;
	esac
done
