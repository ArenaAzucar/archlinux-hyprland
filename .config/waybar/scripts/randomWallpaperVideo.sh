#!/bin/bash

############# 随机给个视频壁纸

# mpvpaper eDP-1 ~/Video/壁纸/Breeze+Tree.mp4 -o " --loop " -f --no-audio

function killProcess() {
	pid=$(ps aux | grep $1 | grep -v 'grep' | awk '{print $2}')
	if [ "$pid" != "" ]; then
		kill $pid
	fi
}

# 随机文件
wallpapers_path="${HOME}/Video/壁纸/"
function randomFile() {
	while [ true ]; do
		############################################
		killProcess "mpvpaper"
        filePath=$(find "$wallpapers_path" -type f | shuf -n 1)
		# mpvpaper eDP-1 ~/Video/壁纸/Breeze+Tree.mp4 -o " --loop --no-audio" -f
		notify-send ${filePath##*/}
		mpvpaper eDP-1 -o "--loop --no-audio" "$filePath"
	done
}
randomFile
