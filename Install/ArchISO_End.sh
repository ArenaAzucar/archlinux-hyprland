#!/bin/bash

# 分配磁盘空间后操作
begin_installArch() {
	# 修改磁盘格式
	read -p "Please enter BootGrub Interval of address:" grubAdd
	read -p "Please enter forwardslash Interval of address:" ForwardSlashAdd
	mkfs.fat -F32 "$grubAdd"
	mkfs.ext4 "$ForwardSlashAdd"
	read -p "Please enter swap Interval of address:" swapAdd
	mkswap "$swapAdd"
	swapon "$swapAdd"
	echo 'Disk Partitioning completed!!! '

	# 挂载分区
	mount "$ForwardSlashAdd" /mnt
	mkdir /mnt/boot
	mount "$grubAdd" /mnt/boot

	# 修改 /etc/pacman.d/mirrorlist
	echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist

	# 开始安装到磁盘
	pacstrap /mnt base linux linux-firmware

	# 生成fstab文件
	genfstab -U /mnt >>/mnt/etc/fstab
}

# 安装好系统后的操作
end_installArch() {
	# #### 语言相关
	echo 'zh_CN.UTF-8 UTF-8' >>/mnt/etc/locale.gen
	echo 'en_US.UTF-8 UTF-8' >>/mnt/etc/locale.gen
	# 注意这里修改的是另一个文件了
	echo 'LANG=en_US.UTF-8' >/mnt/etc/locale.conf

	# 自己输入系统名称
	read -p "Please enter System Name:" sysName
	echo "$sysName" >/mnt/etc/hostname

	echo '' >>/mnt/etc/hosts
	echo '' >>/mnt/etc/hosts
	echo "127.0.0.1	localhost" >>/mnt/etc/hosts
	echo "::1		localhost" >>/mnt/etc/hosts
	echo "127.0.0.1	${sysName}.localdomain  ${sysName}" >>/mnt/etc/hosts
}

begin_installArch
end_installArch
