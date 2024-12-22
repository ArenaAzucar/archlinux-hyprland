# ArenaNaranja - hyprland

# 说明

该仓库是Naranja的archlinux-hyprland配置。

# 预览

默认启动:

![image-20240413140242770.png](https://github.com/ArenaAzucar/archlinux-hyprland/blob/master/assets/image-20240413140242770.png)

waybar启动后的效果:

![image-20240413140416252](https://github.com/ArenaAzucar/archlinux-hyprland/blob/master/assets/image-20240413140416252.png)

![image-20240413140614920.png](https://github.com/ArenaAzucar/archlinux-hyprland/blob/master/assets/image-20240413140614920.png)

![image-20240413140659488.png](https://github.com/ArenaAzucar/Linux-Hyprland/blob/master/assets/image-20240413140659488.png)

# 安装

- 配置pacman

    下面是将pacman的`/etc/pacman.d/mirrorlist`文件所有内容替换 , 但是你可能因为网络原因无法使用这个源. 那么你需要到[archlinux-pacman-mirrorlist](https://archlinux.org/mirrorlist/?country=all&protocol=http&protocol=https&ip_version=4)寻找你能使用的源, 然后修改本地的`/etc/pacman.d/mirrorlist`文件, 可以存放多个(每一个源都是一行否则会报错), 连接速度越快的放越上面.

    ```sh
    echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
    ```

    AUR[非官方用户仓库](https://wiki.archlinuxcn.org/wiki/%E9%9D%9E%E5%AE%98%E6%96%B9%E7%94%A8%E6%88%B7%E4%BB%93%E5%BA%93)配置.

    ```sh
    echo '[multilib]
    Include = /etc/pacman.d/mirrorlist'>>/etc/pacman.conf
    echo '[archlinuxcn]
    SigLevel = Optional TrustAll
    Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch'>>/etc/pacman.conf
    ```

     更新pacman

    ```sh
    sudo pacman -Syy
    sudo pacman -S archlinuxcn-keyring
    ```

- 安装需要的软件

    ```bash
    # 安装一些软件需要的依赖,否则可能会报错
    sudo pacman -S base-devel debugedit fakeroot
    # 安装最新的hyprland
    sudo pacman -S hyprland-git
    # 安装项目需要的软件, 最好配置了archlinuxcn-keyring再安装

    sudo pacman -S swaybg-git mpd mpc ncmpcpp pulseaudio grim bluez bluez-utils pulseaudio-bluetooth fcitx5-im fcitx5-chinese-addons alacritty-git pcmanfm brightnessctl pulseaudio paru-git ttf-monaco ttf-jetbrains-mono-nerd git mako libnotify wlogout zsh autojump zsh-syntax-highlighting zsh-autosuggestions keyd yad noto-fonts-cjk ttf-hack-nerd ttf-profont-nerd hypridle hyprlock
    
    paru -S rofi-lbonn-wayland-only-git oh-my-zsh-git mpvpaper-git
    sudo pacman -S swaybg-git mpd mpc ncmpcpp pulseaudio grim bluez bluez-utils pulseaudio-bluetooth fcitx5-im fcitx5-chinese-addons alacritty-git pcmanfm brightnessctl pulseaudio paru-git ttf-monaco ttf-jetbrains-mono-nerd git mako libnotify wlogout zsh autojump zsh-syntax-highlighting zsh-autosuggestions keyd yad noto-fonts-cjk ttf-hack-nerd ttf-profont-nerd hypridle hyprlock 
    
    paru -S rofi-lbonn-wayland-only-git oh-my-zsh-git mpvpaper-git
    # 如果使用vimrc文件的话，你需要安装插件
    sudo pacman -S npm vim-plug
    # 如果需要用代码提示相关功能，那么需要安装对应的插件和工具
    # 然后执行':PlugUpdate'
    # 如果是coc的插件则是':CocInstall'
    ```

  - swaybg壁纸

  - mpd，mpc，ncmpcpp听歌的

  - bluez bluez-utils pulseaudio-bluetooth蓝牙

  - fcitx5-im fcitx5-chinese-addons 输入法
    - 如果要使用薄荷输入法(rime[中州韵])

            ```ｓｈ
                sudo pacman -S fcitx5-rime-git
              
                # 然后导入薄荷输入法 官方：https://www.mintimate.cc/zh/guide/
                # 下载
                git clone https://github.com/Mintimate/oh-my-rime.git
                # 将oh-my-rime下所有文件复制到　~/.local/share/fcitx5/rime/下
                cp oh-my-rime/* ~/.local/share/fcitx5/rime/ -r 
                # 最后重启输入法。
            ```

  - swayidle 息屏（弃用）

  - alacritty-git 终端模拟器

  - kitty 终端模拟器

  - mako 告警提示, libnotify中的notify-send命令可以发送文本到mako

  - grim截图

  - wlogout这个是waybar右上角的开始按钮用的

  - yad是wlogout需要i使用的工具

  - rofi-lbonn-wayland-only-git软件启动器
    - 仓库里也有wofi软件启动器具的配置

        ```~~
            # 安装wofi
            sudo pacman -S wofi
        ```

  - pcmanfm文件管理工具

      感觉没啥用，基本用不到，我常用的是joshuto或者yazi

      ```bash
      sudo pacman -S joshuto-git 
      sudo pacman -S yazi-git
      ```

  - brightnessctl屏幕亮度调整

  - pulseaudio音量调整

  - keyd 按键修改

  - ttf-monaco ttf-jetbrains-mono-nerd 字体

  - mpvpaper-git 动态壁纸需要用的

  - zsh oh-my-zsh-git autojump zsh-syntax-highlighting zsh-autosuggestions 都是zsh用的

  - hyprlock/hypridle 分别是hyprland的官方锁屏工具和超时执行工具

- 将该项目配置应用到主机

 克隆:`git clone https://github.com/ArenaAzucar/Linux-Hyprland.git`

 ```sh
 # 你可以编写一个bash脚本来覆盖你原本的配置(建议可以备份一下自己的配置)
 path=<克隆项目的本地路径>
 # 将.config下的所有文件覆盖到本地的${HOME}/.config/下
 # 里面包含:alacritty kitty waybar hypr neofetch wlogout mako rofi的配置
 # 你需要修改hypr文件夹中的hyprland.conf文件,里面有几个模块,你需要修改binds.conf的一些配置
 cp $path/.config/* ${HOME}/.config -r
 # mpd ncmpcpp
 cp $path/.mpd ${HOME}/ -r
 cp $path/.ncmpcpp ${HOME}/ -r
 gpasswd -a mpd audio
 # zsh配置文件
 cp $path/.zshrc ${HOME}/.zshrc
 # vim配置文件,配的比较垃圾,不建议使用（已切换为neovim）
 # cp $path/.vimrc ${HOME}/.vimrc
 # 添加输入法需要的环境变量
 echo 'GTK_IM_MODULE=fcitx5
 QT_IM_MODULE=fcitx5
 SDL_IM_MODULE=fcitx5
 XMODIFIERS=@im=fcitx5' >> /etc/environment
 # keyd配置,将capslook键修改成super,但是又不影响其本身的大小写切换,原本的super也不会有影响
 sudo cp $path/keyd/default.conf /etc/keyd/
 # 自动启动蓝牙服务
 sudo systemctl enable bluetooth
 sudo systemctl start bluetooth
 ```

- 如果你是Nvidia显卡(hyprland官方提供的方法[hyprland-Nvidia](https://wiki.hyprland.org/Nvidia/))

  - 安装

    ```sh
    sudo pacman -S nvidia-dkms
    ```

  - 修改grub文件`/etc/default/grub`

    ```sh
    # 修改配置文件/etc/default/grub
    # vim /etc/default/grub
    # 修改'GRUB_CMDLINE_LINUX_DEFAULT'参数,添加参数'nvidia_drm.modeset=1'
    # 例如:
    GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.modeset=1"
    # 然后执行命令
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

  - 修改配置文件`/etc/mkinitcpio.conf`

    ```sh
    # vim /etc/mkinitcpio.conf
    # 修改'MODULES'参数,添加'nvidia nvidia_modeset nvidia_uvm nvidia_drm'到里面
    # 例如:
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    # 运行下面的命令
    sudo pacman -S linux-headers
    mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
    ```

  - 添加一个文件`/etc/modprobe.d/nvidia.conf`(默认应该是不存在的)

    ```sh
    # 添加下面一行参数
    echo 'options nvidia-drm modeset=1' > /etc/modprobe.d/nvidia.conf
    ```

  - 修改`hyprland`配置文件`${HOME}/.config/hypr/hyprland.conf`(默认是这个)

    ```sh
    # 添加hyprland环境变量
    env = LIBVA_DRIVER_NAME,nvidia
    env = XDG_SESSION_TYPE,wayland
    env = GBM_BACKEND,nvidia-drm
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    env = WLR_NO_HARDWARE_CURSORS,1
    # 注意(官网的):
    #  如果在Firefox中遇到崩溃,那就删除'env = GBM_BACKEND,nvidia-drm'这一行
    #   如果遇到Discord窗口无法显示或屏幕共享在Zoom中不起作用的问题,那就删除或注释该行'env = __GLX_VENDOR_LIBRARY_NAME,nvidia'
    ```

  - 安装一些工具

    ```sh
    # 官方文档写的 , 没有好像影响也不大 , 可能我没有用electron框架开发的软件的原因把
    sudo pacman -S qt5-wayland qt5ct libva libva-nvidia-driver-git
    ```

  - 其他参考官网:[hyprland-Nvidia](https://wiki.hyprland.org/Nvidia/)

# 按键

- 我的hyprland按键配置：

  ```bash
  # ## 按键 ## #
  $mainMod = SUPER # 将win键定义为通用按键，后面大部分都引用该按键，后续更改只需要更改此处即可
  $nMod = ALT  # 同上
  ######## Hypr
  $mainMod,T # 打开中的terminal
  $mainMod,C # 关闭窗口
  $mainMod,Q # 关闭窗口
  $mainMod,M # 退出hyprland,相当于windows的注销
  $mainMod,E # 打开文件管理器
  $mainMod,v # 切换窗口浮动
  $mainMod,R # 打开软件启动器
  $mainMod,P # 切换为tiling模式，窗口将保持浮动时的大小
  $mainMod,J # 切换窗口分割方向
  $mainMod,F # 窗口全屏
  ######## waybar
  $mainMod,B # 启动/关闭waybar
  ######## 屏幕     
  $mainMod,[ # 屏幕亮度减少
  $mainMod,] # 屏幕亮度增加
  ######## 截图
  $mainMod,A   # 自己选择,保存到剪切板
  ,Print   # 截全屏，保存到指定目录
  $mainMod,Print # 自己选择，但保存到指定目录
  $nMod,A   # 全屏，保存到剪切板
  ########## mpc（音乐相关）
  $nMod,>  # 下一首歌曲
  $nMod,<  # 上一首歌曲
  $nMod,空格 # 暂停/播放音乐
  ########## 系统音量
  $nMod,]  # 音量加5%（常桉有效）
  $nMod,[  # 音量减5%（常桉有效）
  $nMod SHIFT,] # 音量加15%（常桉有效）
  $nMod SHIFT,[ # 音量减15%（常桉有效）
  ########## hypr窗口操作
  $mainMod,<方向键> # 切换操作窗口
  $mainMod,0～9 # 切换工作区域
  $mainMod SHIFT,0~9 # 将选中窗口移动到指定工作区域
  $mainMod,<鼠标滚轮> # 鼠标滚轮切换工作区域
  $mainMod,<鼠标左键> # 移动窗口位置
  $nMod,<鼠标左键> # 调整窗口大小
  $nMod,<方向键>  # 调整窗口大小
  $mainMod SHIFT,<方向键>  # 移动浮动窗口位置
  $mainMod $nMod,<反向键>   # 移动窗口位置
  ```
  
- keyd(修改按键)

  ```bash
  # 修改配置文件/etc/keyd/default.conf
  [ids]
  
  *
  
  [main]
  # 将capslock改成meta（SUPER）键，只是添加一些组合键,原本的功能不变
  capslock = overload(capslock_layer,capslock)
  
  [capslock_layer]
  b = M-b
  t = M-t
  v = M-v
  s = M-s
  p = M-p
  j = M-j
  f = M-f
  r = M-r
  e = M-e
  c = M-c
  1 = M-1
  2 = M-2
  3 = M-3
  4 = M-4
  5 = M-5
  6 = M-6
  7 = M-7
  8 = M-8
  9 = M-9
  0 = M-0
  w = M-w
  q = M-q
  up = M-up
  down = M-down
  left = M-left
  right = M-right
  [ = M-[
  ] = M-]
  rightshift = right
  ```
  
# 遇到的问题

1. waybar崩溃

   报错:`segmentation fault (core dumped)  waybar`

   不知道怎么处理, 可能是配置文件有问题, 偶尔会出现这个问题.

2. waybar触发点击事件后不管点击waybar的任何其他按钮都会触发之前的按钮事件。

   。。。。不知道杂处理

3. obs录屏问题

   - 问题:obs安装后没有`屏幕采集`

   ```sh
   # 安装
   paru -S xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk pavucontrol pipewire
   sudo pacman -S obs-studio-git
   # 修改hyprland配置 (~/.config/hypr/land/exec_once.conf)
   # obs录屏需要
   # audio,xdg desktop obs录屏用
   exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
   exec-once = systemctl --user stop pipewire pipewire-pulse wireplumber xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk
   exec-once = systemctl --user start pipewire pipewire-pulse wireplumber xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk
   
   # 重启
   ```

   - 问题:obs有`屏幕采集`,但是采集的是黑屏

   ```sh
   # 需要修改配置文件
   # 这个是全局生效:/usr/share/applications/com.obsproject.Studio.desktop
   # 当前用户生效: ~/.local/share/applications/com.obsproject.Studio.desktop
   # 修改里面Exec的参数,原本应该是obs,在后面加个 -platform wayland即可
   Exec=obs -platform wayland
   # 重启/注销
   ```

   - 问题:obs启动报错`obs: error while loading shared libraries: libpython3.11.so.1.0: cannot open shared object file: No such file or directory`

   ```bash
    # 这个问题是因为/usr/bin目录下缺少'libpython3.11.so.1.0'，或类似的
    # 你可以下载python3然后复制其中的lib下的libpython3.11.so.1.0文件到/usr/bin目录下
    
    # 如果你有安装或使用pyenv工具,那么你可以pyenv install 3.11.9安装一个pythen版本。
    # 然后再在'$HOME/.pyenv/versions/'找到自己安装的版本号，进入到目录，找到lib目录，复制其中的'libpython3.11.so.1.0'到/usr/lib/
    sudo cp .pyenv/versions/3.11.9/lib/libpython3.11.so.1.0 /usr/lib
   ```

4.   240531.问题:fcitx5更新后，切换输入法时fcitx5程序会挂。(目前该问题不再出现240702)

     ```bash
     # 跟新了fcitx5的环境变量
     vim ~/.config/hypr/land/hypr_env.conf
     # 如果还是程序莫名挂，那么请放弃使用中州韵输入法（可以在fcitx5的设置中切换）。
     ```


# 参考文档

> hyprland官方wiki：<https://wiki.hyprland.org/>

> waybar-wiki：<https://github.com/Alexays/Waybar/wiki>

> <https://github.com/notwidow/hyprland>

> <https://www.bilibili.com/read/cv22707313/>

> <https://cascade.moe/posts/hyprland-configure/>

> <https://nth233.top/posts/2023-02-26-Hyprland%E9%85%8D%E7%BD%AE>

> <https://github.com/prasanthrangan/hyprdots>

> <https://github.com/LitSKt/Hyprland_Configuration>

> 动态壁纸: <www.bilibili.com/video/BV1xg4y1j7yH>

> neofetch(弃用): <https://github.com/Chick2D/neofetch-themes/blob/main/small/ozozfetch.conf>

