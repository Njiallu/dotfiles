#!/bin/bash
DISPLAY=:0
options=(
"debug:0"
"reload:0"
"quiet:0"
"force:0"
"default:bar"
"binary:polybar"
"config:"
)
conversion_table=(
"debug:"
"reload:r"
"quiet:q"
"force:"
"default:"
"binary:"
"config:c=%"
)

print_array () {
	while [ "$#" -gt 0 ]; do
		printf "\e[36m[ \e[1;36m$1\e[0m\e[36m ]\e[0m"
		shift
	done
}

print_options () {
	local len=0
	for ((i = 0; i < ${#options[@]}; i++)); do
		tmp="$(echo ${options[i]} | cut -d: -f1 | wc -c)"
		if [[ $tmp -gt $len ]]; then
			len=$tmp
		fi
	done
	for ((i = 0; i < ${#options[@]}; i++)); do
		local option=$(printf "'%s'" $(echo ${options[i]} | cut -d: -f1))
		local value=$(echo ${options[i]} | cut -d: -f2-)
		if [[ -z $value ]]; then value="none"; fi
		printf "\e[33m%-$(expr $len + 1)s\e[0m \e[37m: %s\e[0m\n" $option $value
	done
}

set_option () {
	for ((i = 0; i < ${#options[@]}; i++)); do
		if [[ $1 == $(echo ${options[i]} | cut -d: -f1) ]]; then
			options[i]="$1:$2"
		fi
	done
}

get_option () {
	for ((i = 0; i < ${#options[@]}; i++)); do
		if [[ $1 == $(echo ${options[i]} | cut -d: -f1) ]]; then
			echo ${options[i]} | cut -d: -f2-
		fi
	done
}

# Note for future self:
# There is a bug in this function caused by the interpretation chars
# in the sed, eg: ./Downloads
# Where the '/' is interpreted and cause the sed to fail
#
# I need to find a way to tell sed to use that part a raw text for regex
generate_polybar_command () {
	local polybar_cmd="$(which $(get_option "binary"))"
	for ((i = 0; i < ${#options[@]}; i++)); do
		local param="$(get_option $(echo ${options[i]} | cut -d: -f1))"
		local option="$(echo ${conversion_table[i]} | cut -d: -f2-)"
		if [[ "$param" != 0 && ! -z "$param" && ! -z $option ]]; then
			polybar_cmd+=" -${option//%/$param}"
		fi
	done
	echo $polybar_cmd
}

kill_polybars () {
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

launch_polybars () {
	# Get the command
	local cmd=$1
	shift
	# Get the rest as an array
	local bars=("$@")

	# If there is no bars then set to the default one
	if [[ -z $bars ]]; then
		echo "no bars, set bars to $(get_option "default")" >&2
		bars=(get_option "default")
	fi

	if type "xrandr" > /dev/null; then
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			for i in $bars; do
				MONITOR=$m $cmd $i &
			done
		done
	else
		for i in $bars; do
			$cmd $i &
		done
	fi
}

# Get options
while getopts ":Dc:fdrq" opt; do
	error=0
	case $opt in
		c)
			set_option "config" $(realpath "$OPTARG")
			;;
		d)
			set_option "debug" 1
			;;
		D)
			set_option "default" "$OPTARG"
			;;
		f)
			set_option "force" 1
			;;
		q)
			set_option "quiet" 1
			;;
		r)
			set_option "reload" 1
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done
# Remove options from arguments
shift "$((OPTIND-1))"

# Generate the command line and bars
cmd=$(generate_polybar_command)
bars=("$@")

# Debug feature
if [[ "$(get_option "debug")" -gt 0 ]]; then
	echo -e "\e[1;33moptions:\e[0m\n$(print_options)\e[0m"
	echo -e "\e[1;32mcmd:\e[0m  \e[37m'${cmd}'\e[0m"
	echo -e "\e[1;36mbars:\e[0m $(print_array ${bars[*]})"
fi

# Kills any potential unwanted bars
if [[ $(get_option "force") != 0 ]]; then
	kill_polybars
fi
# Then relaunch the bars you want
launch_polybars "${cmd}" ${bars[@]}
