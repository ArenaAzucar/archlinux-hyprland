#!/bin/bash

<<<<<<< HEAD
# 分配磁盘空间后操作
begin_installArch() {
	# 修改磁盘格式
	read -p "Please enter BootGrub Interval of address:" grubAdd
	read -p "Please enter forwardslash Interval of address:" ForwardSlashAdd
	mkfs.fat -F32 "$grubAdd"
	mkfs.ext4 "$ForwardSlashAdd"
	read -p "Please enter swap Interval of address:" swapAdd
=======
#  磁盘分区
#  fdisk -l     #  查看磁盘
#  fdisk <url>  #  <url> 替换需要修改的磁盘路径，例如：fdisk /dev/sda
#  ### 使用fdisk /dev/sda 进入fdisk命令行后：
#  ####### 需要使用的命令：
#  ####################### g:格式化 n:进行分区 p:查看分区 w:保存并退出
#  ####### 常用的磁盘分区：
#  #######  ############# 
#  设备               起点       末尾      扇区   大小 类型
# /dev/sda           2048    2099199   2097152     1G Linux 文件系统
# /dev/sda        2099200   35653631  33554432    16G Linux 文件系统
# /dev/sda       35653632 1000214527 964560896 459.9G Linux 文件系统
# 


# 做完以上分区操作后执行
# 分配磁盘空间后操作
begin_installArch() {
	# 修改磁盘格式
    echo-e  " \e[5mBoot/Grub"
	read -p "Please enter BootGrub Interval of address:" grubAdd
	read -p "Please enter forwardslash Interval of address:" ForwardSlashAdd
	read -p "Please enter swap Interval of address:" swapAdd
	mkfs.fat -F32 "$grubAdd"
	mkfs.ext4 "$ForwardSlashAdd"
>>>>>>> 6af33fd (test)
	mkswap "$swapAdd"
	swapon "$swapAdd"
	echo 'Disk Partitioning completed!!! '

	# 挂载分区
	mount "$ForwardSlashAdd" /mnt
	mkdir /mnt/boot
	mount "$grubAdd" /mnt/boot

<<<<<<< HEAD
	# 修改 /etc/pacman.d/mirrorlist
	echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist
=======
	# 修改pacman源 /etc/pacman.d/mirrorlist
	echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
>>>>>>> 6af33fd (test)

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
<<<<<<< HEAD
	read -p "Please enter System Name:" sysName
	echo "$sysName" >/mnt/etc/hostname

	echo '' >>/mnt/etc/hosts
	echo '' >>/mnt/etc/hosts
=======
    echo "请输入系统名称！！！！！"
	read -p "Please enter System Name:" sysName
	echo "$sysName" > /mnt/etc/hostname

    # 修改hosts文件，否则可能无法上网
	echo '' >> /mnt/etc/hosts
	echo '' >> /mnt/etc/hosts
>>>>>>> 6af33fd (test)
	echo "127.0.0.1	localhost" >>/mnt/etc/hosts
	echo "::1		localhost" >>/mnt/etc/hosts
	echo "127.0.0.1	${sysName}.localdomain  ${sysName}" >>/mnt/etc/hosts
}

begin_installArch
end_installArch
