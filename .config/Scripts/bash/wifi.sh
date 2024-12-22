#!/bin/bash

# 连接wifi
#
# 我电脑的无线网卡名称是wlan0

wlan="wlan0"

# 搜索
function scanNetwork() {
    # 搜索
    iwctl station $wlan scan

    # 获取搜索结果
    iwctl station $wlan get-networks | tail -n +6 | awk '{print $1 "\t" NR}'
    echo "n = 不连接"
    echo "d = 断开连接"
}

scanNetwork

read -p "输入需要连接的wifi,末尾数字即可 : " wifiId

if [ "$wifiId" == "n" ] || [ "$wifiId" == "N" ]; then
    exit
elif [ "$wifiId" == "d" ] || [ "$wifiId" == "D" ]; then
    iwctl station $wlan disconnect
else
    wifiName=$(iwctl station $wlan get-networks | tail -n +6 | awk '{print $1}' | sed -n "$wifiId"p)

    read -p "是否要连接:$wifiName ???(y/n):" enter
    if [ "$enter" == "Y" ] || [ "$enter" == "y" ]; then
        # 连接wifi
        iwctl station $wlan connect $wifiName
    fi
fi
