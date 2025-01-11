#!/bin/bash -e

# 设置熄屏不睡眠
#

function killProcess() {
    pid=$(ps aux | grep "$1" | grep -v 'grep' | awk '{print $1}')
    if [ "$pid" != "" ]; then
        kill $pid
    fi
}

function startBash() {
    hypridleStateFile="$HOME/.config/waybar/scripts/hyprlockState"
    if [[ -f "$hypridleStateFile" ]]; then
        rm $hypridleStateFile
        killProcess "hypridle"
        notify-send "已切换正常hypridle配置~"
        hypridle -c "$HOME/.config/hypr/hypridle.conf"
    else
        touch $hypridleStateFile
        killProcess "hypridle"
        notify-send "已切换熄屏不睡眠hypridle配置~"
        hypridle -c "$HOME/.config/hypr/hypridle_nolock.conf"
    fi
}

startBash
