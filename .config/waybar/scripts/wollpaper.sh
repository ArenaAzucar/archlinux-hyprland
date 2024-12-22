#!/bin/bash

########## 壁纸
path="${HOME}/.config/waybar/scripts"

function killProcess() {
	pid=$(ps aux | grep "$1" | grep -v 'grep' | awk '{print $2}')
	if [ "$pid" != "" ]; then
		kill $pid
	fi
}

function main() {
	case "${1}" in
	1)
		killProcess "randomWallpaperVideo"
		killProcess "mpvpaper"
		killProcess "background-changer"
		killProcess "swaybg"
		bash "$path/background-changer" &
		;;
	2)
		killProcess "randomWallpaperVideo"
		killProcess "mpvpaper"
		killProcess "background-changer"
		killProcess "swaybg"
		bash "$path/randomWallpaperVideo.sh" &
		;;
	esac

}

main $1
