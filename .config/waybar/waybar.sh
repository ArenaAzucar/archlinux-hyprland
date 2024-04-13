#!/bin/bash

# 随机启动waybar
#

rand=$(($RANDOM % 4))

Themes_0() {
	waybar --config ~/.config/waybar/default/config.jsonc --style ~/.config/waybar/default/style.css
}

Themes_1() {
	waybar --config ~/.config/waybar/Themes/bluish/config.jsonc --style ~/.config/waybar/Themes/bluish/style.css
}

Themes_2() {
	waybar --config ~/.config/waybar/Themes/minimal/config.jsonc --style ~/.config/waybar/Themes/minimal/style.css
}

Themes_3() {
	waybar --config ~/.config/waybar/Themes/layer/config.jsonc --style ~/.config/waybar/Themes/layer/style.css
}

startWaybar() {
	if [ "$rand" = "0" ]; then
		Themes_0
	elif [ "$rand" = "1" ]; then
		Themes_1
	elif [ "$rand" = "2" ]; then
		Themes_2
	elif [ "$rand" = "3" ]; then
		Themes_3
	fi

}

startWaybar
