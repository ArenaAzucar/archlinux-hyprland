#!/bin/bash

# 连接网络
ip a
read -p "Please enter the name of the network card：" netWorkCard
echo $netWorkCard
iwctl station $netWorkCard scan
iwctl station $natWorkCard get-networks
read -p "Please enter Wireless network name:" netWorkName
read -p "Please enter networkPassWord:" netWorkPasswd
echo "$netWorkPasswd" | iwctl station $netWorkCard connect $netWorkName
# 自动获取ip
dhcpcd

# 测试网络
ping baidu.com

# 同步系统时间
timedatectl set-ntp true

echo 'Please partition the disk!!!'
