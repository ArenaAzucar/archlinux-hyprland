#!/bin/bash
# ########## 基础配置

function Aur_paru() {
	# 修改 /etc/pacman.d/mirrorlist
	echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist
	# 修改pacman.conf
	echo '[multilib]
Include = /etc/pacman.d/mirrorlist' >>/etc/pacman.conf
	echo '[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >>/etc/pacman.conf
	# 更新
	sudo pacman -Syy
	sudo pacman -S archlinuxcn-keyring
	sudo pacman -S paru-git
	echo 'Aur_paru installation is complete!!!'
}

function MyHyprland() {
	echo "================= begin"
	echo y | pacman -S base-devel debugedit fakeroot >/dev/null
	echo y | pacman -S hyprland-git >/dev/null # 安装最新的hyprland
	# 安装软件
	installApp='swaybg-git mpd mpc ncmpcpp pulseaudio grim 
    bluez bluez-utils pulseaudio-bluetooth fcitx5-im 
    fcitx5-pinyin-zhwiki alacritty-git pcmanfm brightnessctl 
    pulseaudio paru-git ttf-monaco ttf-jetbrains-mono-nerd git 
    mako libnotify wlogout zsh autojump zsh-syntax-highlighting 
    zsh-autosuggestions keyd yad noto-fonts-cjk 
    ttf-hack-nerd ttf-profont-nerd hypridle hyprlock'
	echo y | pacman -S $installApp >/dev/null
	# 用paru安装pacman没有的工具
	paru -S rofi-lbonn-wayland-only-git oh-my-zsh-git mpvpaper-git >/dev/null

	# 添加mpd到用户组
	gpasswd -a mpd audio
	# 自动启动蓝牙服务
	sudo systemctl enable bluetooth
	sudo systemctl start bluetooth
	# echo y | yay -S rofi-lbonn-wayland-only-git
	cp -r "./.config/*" "${HOME}/.config/"
	cp -r "./.mpd" "${HOME}/"
	cp -r "./.ncmpcpp" "${HOME}/"
	cp "./.vimrc" "${HOME}/"
	cp "./.zshrc" "${HOME}/"
	cp "./keyd/default.conf" /etc/keyd/
	echo 'GTK_IM_MODULE=fcitx5
 QT_IM_MODULE=fcitx5
 SDL_IM_MODULE=fcitx5
 XMODIFIERS=@im=fcitx5' >>/etc/environment
	echo "================= end"
}

function main() {
	echo "Please use administrator privileges to start(sudo)!!!!"
	Aur_paru
	# sleep 10s
	MyHyprland
	# 修改/etc/pulse/default.pa文件
	# echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1" >> /etc/pulse/default.pa
}

main
