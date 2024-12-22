#!/bin/bash

# 调整音量使用
#

# 获取当前使用的声卡id
function get_default_id() {
    running_id=$(echo $(($(pactl list sinks | awk '/RUNNING/{print NR}') - 1)))
    sinks_id=$(pactl list sinks | sed -n "$running_id"p)
    # echo "running == $running_id"
    # echo "sinks == ${sinks_id: -1}"
    echo "${sinks_id: -1}"
}

# 增高音量
function volume_up() {
    pactl -- set-sink-volume $(get_default_id) +1%
}

# 降低音量
function volume_down() {
    pactl -- set-sink-volume $(get_default_id) -1%
}

# 静音
function volume_toggle() {
    pactl -- set-sink-mute $(get_default_id) toggle
}

# get_default_id

function volume() {
    # echo "输入 == $1"
    if [ "$1" == "1" ]; then
        volume_up
    elif [ "$1" == "2" ]; then
        volume_down
    else
        volume_toggle
    fi
}

# echo $1
volume $1
