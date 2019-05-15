path=$(dirname "$(realpath "$0")")
path_bar="$HOME/.config/polybar"
path_wallpaper="$HOME/Pictures"
path_set_wallpaper="$HOME/.bgfile"
path_set_wallpaper_blurred="$HOME/.bg_blurred.png"
dmenu_cmd="rofi -dmenu"

wallpapers=$(find "$path_wallpaper" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname "*.png" -o -iname "*.gif" \) -print | sed "s|$path_wallpaper/||g" | sort -d)

themes=(
"gruvbox"
"laserbox"
)
bars=(
"flat"
"flat_transparent"
"flat_alt_transparent"
)
positions=(
"top"
"bottom"
)

# $1 -> position of bar
# $2 -> colorway
# $3 -> bar name
theme_to_apply=(
"top gruvbox flat"
)

notify () {
	$path/notify.sh -a "Theme switcher" "$@" -i "applications-graphics"
}

get_theme_to_apply ()
{
	if [[ -z "${1}" ]]; then
		exit 1
	fi
	local theme=$(echo $1 | awk '{$1=$1};1' | sed "s/ /_/g")
	shift 2
	local position=$(echo $1 | cut -d "[" -f2 | cut -d "]" -f1)
	shift
	local bar=$(echo $@ | awk '{$1=$1};1' | sed "s/ /_/g")
	local theme=(${position,,} ${theme,,} ${bar,,})
	echo -ne ${theme[*]}
}

# Those get functions takes a theme as an argument.
get_bar_name ()
{
	echo "${1}_${2}_${3}"
}

get_colorscheme ()
{
	echo "$2"
}

# This get function needs to have a wallpaper filename as an argument.
get_wallpaper_file ()
{
	for wallpaper in ${wallpapers[@]}; do
		if [[ "${1,,}" == "${wallpaper,,}" ]]; then
			echo "$path_wallpaper/$wallpaper"
			break
		fi
	done
	echo ""
}

# No argument needed.
# This will generate the themes variants menu items for the dmenu.
# It will return the theme chosen by the user as a modified string
#  containing the theme.
theme_chooser_popup ()
{
	ifs_old=$IFS
	IFS=$'\n'
	local choices
	for theme in ${themes[@]}; do
		for pos in ${positions[@]}; do
			for bar in ${bars[@]}; do
				choices+="${theme^} - [${pos^}] ${bar/_/ }\n"
				# echo -e "debug: '${theme}' - '${bar}'" >&2
			done
		done
	done
	# echo -e "choices: '${choices}'" >&2
	IFS=$ifs_old
	echo -ne ${choices} | ${dmenu_cmd}
}

# No argument needed.
# This will generate the wallpaper menu items for the dmenu.
# This will return the wallpaper chosen by the user as a formated string
#  containing the wallpaper file name.
wallpaper_chooser_popup ()
{
	ifs_old=$IFS
	IFS=$'\n'
	local choices
	for wallpaper in ${wallpapers[@]}; do
				choices+="${wallpaper^}\n"
	done
	IFS=$ifs_old
	echo -ne ${choices} | ${dmenu_cmd}
}

blur_wallpaper () {
	local resolution=$(xrandr --query |grep -w 'connected' | grep -oE '[0-9]+x[0-9]+')
	convert -resize "${resolution:-1920x1080}^" \
			-gravity center \
			-extent "${resolution:-1920x1080}" \
			-scale 10% -blur 0x2.5 -resize 1000% \
			"$1" "$path_set_wallpaper_blurred"
}

change_polybar () {
	$path/launch_bar.sh -rqfc $path_bar/config $1
}

change_i3wm () {
	$path/swap_i3wm_theme.sh $1
}

change_wallpaper () {
	local resolution=$(xrandr --query |grep -w 'connected' | grep -oE '[0-9]+x[0-9]+')
	convert -resize "${resolution:-1920x1080}^" \
			-gravity center \
			-extent "${resolution:-1920x1080}" \
			"$1" "$path_set_wallpaper"
	feh --bg-center "$path_set_wallpaper"
}

change_theme () {
	local output_theme=$(theme_chooser_popup)
	local output_wallpaper=$(wallpaper_chooser_popup)
	local tmp=$(get_theme_to_apply $output_theme)
	if [[ "$tmp" != "" ]]; then
		theme_to_apply=(${tmp[*]})
		notify "Theme $output_theme applied"
		change_polybar $(get_bar_name ${theme_to_apply[*]}) & \
		change_i3wm $(get_colorscheme ${theme_to_apply[*]})
	fi
	if [[ "$output_wallpaper" != "" && "$output_wallpaper" != " " ]]; then
		echo "Wallpaper changing..." && \
			change_wallpaper $(get_wallpaper_file $output_wallpaper) \
			&& notify "Wallpaper $output_wallpaper applied" && \
			echo "Wallpaper change!" & \
		echo "Wallpaper blurring..." \
			&& blur_wallpaper $(get_wallpaper_file $output_wallpaper) && \
			notify "$output_wallpaper has been blurred!" \
					"The new file is $path_set_wallpaper_blurred" && \
			echo "Wallpaper blurred!"
	fi
}

change_theme
