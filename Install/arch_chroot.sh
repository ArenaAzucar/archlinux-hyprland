#!/bin/bash
<<<<<<< HEAD

# 修改root用户密码
passwd

# 安装系统网络等工具
pacman -S iwd dhcpcd vi sudo

# 添加新非root用户
read -p "Please enter New USER Name :" userName

useradd -m -G wheel -s /bin/bash "$userName"

passwd "$userName"

# 将新增用户的所在组添加到sudoers配置文件
echo '%wheel ALL=(ALL:ALL) ALL' >> /etc/sudoers
=======
echo "此文件在执行完ArchISO_End.sh后，执行archroot /mnt命令后执行！！！！"

# 修改root用户密码
echo "update passwd with root: "
passwd

# 安装系统网络等工具
echo "==================Install NetWorks devices tools!========================"
pacman -S iwd dhcpcd vi sudo
# 将iwd,dhcpcd服务改成默认启动,否则系统安装完成后不能自动联网，挺烦的。。。
systemctl enable iwd.service
systemctl enable dhcpcd.service

# 添加新非root用户
echo "=================Add New User and update the user password!============="
read -p "Please enter New USER Name :" userName
useradd -m -G wheel -s /bin/bash "$userName"
echo "update NewUser password($userName):"
passwd "$userName"

# 将新增用户的所在组添加到sudoers配置文件
echo '%wheel ALL=(ALL:ALL) ALL' >>/etc/sudoers
>>>>>>> 6af33fd (test)

# 创建时区，并写入文件
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 同步系统时间
hwclock --systohc

# locale-gen根据刚在U盘系统中修改的文件安装语言
locale-gen

<<<<<<< HEAD
=======
echo "==============================================================="
echo "========================install grub=========================="
>>>>>>> 6af33fd (test)
# 安装系统引导,intelcpu驱动 等工具 , 这里是intel的 , amd自行百度
pacman -S grub efibootmgr intel-ucode os-prober

# 创建文件夹并生成grub配置文件
mkdir /boot/grub
grub-mkconfig >/boot/grub/grub.cfg

# 安装grub
# uname -m    # 这是查看cpu架构会否支持 , 现在的cpu应该都是x86_64的了
grub-install --target=x86_64-efi --efi-directory=/boot #安装 , 注意修改架构 , 不会就百度

<<<<<<< HEAD
echo 'installation is complete!!!'
=======
echo '==============installation is complete!!!==================='
>>>>>>> 6af33fd (test)
