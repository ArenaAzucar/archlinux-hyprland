#!/bin/bash
# ########## 基础配置

function Aur_paru() {
	# 修改 /etc/pacman.d/mirrorlist
	sudo echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >/etc/pacman.d/mirrorlist
	# 修改pacman.conf
	sudo echo '[multilib]
Include = /etc/pacman.d/mirrorlist' >>/etc/pacman.conf
	sudo echo '[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >>/etc/pacman.conf
	# 更新
	sudo pacman -Syy
	sudo pacman -S archlinuxcn-keyring paru-git
	echo 'Aur_paru installation is complete!!!'
}

function MyHyprland() {
	echo "================= begin"
	read -p "Please enter archlinux-hyprland project url:" url
	sudo pacman -S base-devel debugedit fakeroot
	sudo pacman -S hyprland-git # 安装最新的hyprland
	# 安装软件
	sudo pacman -S swaybg-git mpd mpc ncmpcpp pulseaudio grim bluez bluez-utils pulseaudio-bluetooth fcitx5-im fcitx5-pinyin-zhwiki alacritty-git pcmanfm brightnessctl pulseaudio paru-git ttf-monaco ttf-jetbrains-mono-nerd git keyd-git mako libnotify wlogout zsh autojump zsh-syntax-highlighting zsh-autosuggestions yad noto-fonts-cjk neovim-git neofetch slurp ttf-hack-nerd ttf-profont-nerd hypridle hyprlock
	# 用paru安装pacman没有的工具
	paru -S rofi-lbonn-wayland-only-git oh-my-zsh-git mpvpaper-git

	# 添加mpd到用户组
	gpasswd -a mpd audio
	# 自动启动蓝牙服务
	sudo systemctl enable bluetooth
	sudo systemctl start bluetooth
	# echo y | yay -S rofi-lbonn-wayland-only-git
	cp -r "${url}/.config" "${HOME}/.config"
	cp -r "${url}/.mpd" "${HOME}/"
	cp -r "${url}/.ncmpcpp" "${HOME}/"
	cp "${url}/.vimrc" "${HOME}/"
	cp "${url}/.zshrc" "${HOME}/"
	sudo cp "${url}/keyd/default.conf" /etc/keyd/
	sudo echo 'GTK_IM_MODULE=fcitx5
 QT_IM_MODULE=fcitx5
 SDL_IM_MODULE=fcitx5
 XMODIFIERS=@im=fcitx5' >>/etc/environment
	# 添加zsh终端的插件
	sudo ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/custom/plugins
	sudo ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins
	echo "================= end"
}

function main() {
	echo "Please use administrator privileges to start(sudo/su)!!!!"
	Aur_paru
	# sleep 10s
	MyHyprland
	# 修改/etc/pulse/default.pa文件
	echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1" >>/etc/pulse/default.pa
}

main
