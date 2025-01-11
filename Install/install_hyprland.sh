#!/bin/bash -e

# 以root权限运行

read -p "Please enter username: " user_local


# 更新Ａｕｒ ，修改配置
Aur_config_update() {
    # 修改配置, /etc/pacman.conf , /etc/pacman.d/mirrorlist
    echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >>/etc/pacman.d/mirrorlist
    echo '[multilib]
Include = /etc/pacman.d/mirrorlist' >>/etc/pacman.conf
    echo '[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >>/etc/pacman.conf
# 校验是否已经执行过Aur_config_update函数
Aur_Cn() {
    size=$(cat /etc/pacman.conf | grep -c 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch')
    size=$(grep -v "^#" /etc/pacman.conf | grep -c 'multilib')
    if [[ size == 0 ]]; then
        Aur_config_update
    else
        echo 'Pacman Aur Config No need to modify!'
    fi
}

# 更新Ａｕｒ ，修改配置
Aur_config_update() {
    # 修改配置, /etc/pacman.conf , /etc/pacman.d/mirrorlist
    pacmanConfMultilib='[multilib]
Include = /etc/pacman.d/mirrorlist'
    mirrorsListServer='Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch'
    pacmanConfArchCn='[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch'
    echo "$mirrorsListServer" >/etc/pacman.d/mirrorlist
    echo "$pacmanConfMultilib" >>/etc/pacman.conf
    echo "$pacmanConfArchCn" >>/etc/pacman.conf
# >>>>>>> 6af33fd (test)

    # 更新
    pacman -Syy archlinuxcn-keyring

    echo "===============================Ａur Aur_config_update=================================="
}

# 安装需要的工具
install_toots() {
    # 安装一些软件需要的依赖,否则可能会报错
    pacman -S base-devel debugedit fakeroot
    # 安装最新的hyprland
    pacman -S hyprlock hypridle hyprland
    # 安装项目需要的软件, 最好配置了archlinuxcn-keyring再安装
    # pacman -S swaybg-git mpd mpc ncmpcpp oh-my-zsh-git wofi pulseaudio grim bluez bluez-utils pulseaudio-bluetooth fcitx5-im fcitx5-chinese-addons alacritty-git pcmanfm brightnessctl pulseaudio paru-git ttf-monaco ttf-jetbrains-mono-nerd git mako libnotify wlogout zsh autojump zsh-syntax-highlighting zsh-autosuggestions keyd yad noto-fonts-cjk ttf-hack-nerd ttf-profont-nerd hypridle hyprlock

    su - $user_local -c "paru -S rofi-lbonn-wayland-only-git mpvpaper-git"
    # 安装项目需要的软件, 最好配置了archlinuxcn-keyring再安装 , 不用终端听歌工具了mpd mpc ncmpcpp
    pacman -S swaybg-git oh-my-zsh-git wl-clipboard wofi pulseaudio grim bluez bluez-utils tmux slurp openssh vim pulseaudio-bluetooth fcitx5-im fcitx5-chinese-addons kitty alacritty-git pcmanfm yazi-git waybar-git brightnessctl pulseaudio paru ttf-monaco ttf-jetbrains-mono-nerd git mako libnotify wlogout zsh autojump zsh-syntax-highlighting zsh-autosuggestions keyd-git yad noto-fonts-cjk ttf-hack-nerd ttf-profont-nerd pavucontrol blueman
    su - $user_local -c "paru -S rofi-lbonn-wayland-only-git mpvpaper-git vim-plug-git"

    systemctl enable bluetooth
    systemctl start bluetooth

    # 插件配置
    ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/custom/plugins/
    ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/
    echo "install hyprland toots scuesses! "
}

copy_my_config() {
    echo "archlinux-hyprland path example : $PWD"
    read -p "Please enter archlinux-hyprland path :" url
    cp -r "$url/.config/*" "/home/$user_local/.config/"
    cp "$url/keyd/default.conf" "/etc/keyd/default.conf"
    cp -r "$url/.mpd" "/home/$user_local/"
    cp -r "$url/.ncmpcpp" "/home/$user_local/"
    cp "$url/.vimrc" "/home/$user_local/"
    cp "$url/.zshrc" "/home/$user_local/"
    
    # zsh插件配置
    ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/custom/plugins/
    ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins
    chsh -s /usr/bin/zsh
    echo "install hyprland toots scuesses! "
}

# 应用我的hyprland桌面环境。
copy_my_config() {
    echo "archlinux-hyprland path example : $PWD"
    echo "Example: /home/Azucar"
    read -p "Please enter archlinux-hyprland path :" url
    cp -rf "$url/archlinux-hyprland/.config" "/home/$user_local/.config/"
    cp -rf "$url/archlinux-hyprland/keyd/default.conf" "/etc/keyd/default.conf"
    # cp -r "$url/.mpd" "/home/$user_local/"
    # cp -r "$url/.ncmpcpp" "/home/$user_local/"
    cp "$url/archlinux-hyprland/.vimrc" "/home/$user_local/"
    cp "$url/archlinux-hyprland/.zshrc" "/home/$user_local/"

    echo "The config apply to computer!"
}

Aur_config_update
Aur_Cn
install_toots
copy_my_config
