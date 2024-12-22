# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/


export LANG=zh_CN.UTF-8

# flutter 配置
# flutter 镜像
# export PUB_HOSTED_URL=https://pub.flutter-io.cn
# export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
# 上海交大
# export PUB_HOSTED_URL=https://mirror.sjtu.edu.cn/dart-pub;
# export FLUTTER_STORAGE_BASE_URL=https://mirror.sjtu.edu.cn
# 清华大学
# export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub;
# export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
# export CHROME_EXECUTABLE=/usr/bin/chromium

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
 
# ZSH_THEME="agnoster"
# ZSH_THEME="ys"
ZSH_THEME="theunraveler"

# golang configuration
export GOROOT=/usr/lib/go  #设置为go安装的路径，有些安装包会自动设置默认的goroot
export GOPATH=$HOME/go-work   #默认的Golang项目的工作空间
export GOBIN=/usr/bin/go   # go install命令生成的可执行文件的路径
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# man : 使用man命令时，其文档显示在neovim中
export MANPAGER='nvim +Man!'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
        autojump
        zsh-syntax-highlighting
        zsh-autosuggestions
)



###################################################################
# key bindings 处理zsh不能home和end的问题
# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
####################################################################


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias man="man -M /usr/share/man/zh_CN"
alias py="python"
# alias typora="/opt/Typora-linux-x64/Typora"
alias startdocker="sudo systemctl start docker.service"
#alias vim="nvim"
alias docker_Sqlserver='docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Qq.123123" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest'
alias docker_Mysql='docker run --name mysql -d -p 3306:3306 --restart unless-stopped -v /mydata/mysql/log:/home/Azucar/docker/mysql/log/mysql -v /mydata/mysql/data:/home/Azucar/docker/mysql/var/lib/mysql -v /mydata/mysql/conf:/home/Azucar/docker/mysql/etc/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:8.4.0'
alias docker_postgreSql='docker run -d --name "pgSql" --privileged=true -e "POSTGRES_PASSWORD=123123" -p 5432:5432 -v /mydata/postgres/data:/home/Azucar/docker/postgresql/data -d postgres:15.4'

scripts="$HOME/.config/Scripts"
# cp mv等命令加上进度
alias cpcp="sh $scripts/diyCpMv.sh 1 "
alias mvmv="sh $scripts/diyCpMv.sh 2 "

# wifi连接脚本
alias wificonnect="sh ~/.config/Scripts/bash/wifi.sh"


# 自动获取arch pacman的最快的源
alias reflectora="sudo reflector --verbose -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist"
alias remake="echo 'VirtualBox虚拟机：
    桥接报错用：sudo modprobe vboxnetflt 
    虚拟机启动报错：sudo modprobe vboxdrv
python虚拟环境：
    安装指定版本的python：pyenv install 3.9
    为当前目录下运行的程序设置python版本：pyenv local 3.9
    创建虚拟环境：virtualenv envname
    创建指定python版本的虚拟环境 ：virtualenv -p python3.9 envname
    激活虚拟环境：source 路径目录/activate
    退出虚拟环境：deactivate
waybar不显示音量，或无法调节音量：
    应该是该服务的问题pulseaudio。
    可以杀死原本的pulseaudio进程，
    查找进程：ps aux | grep pulseaudio
    然后：pulseaudio --start 重新启动
'"

# ########## vscode滚动更新后美化插件失效，每次都需要重新调整，20240620在此进行修改
alias vscode-update="sudo sh ~/.config/Scripts/VSCodeUpdate.sh "
# ###########



# ## hyprland 2024.10.05移除,所有环境配置迁移到".config/hypr/land/hypr_env.conf"中,直接命令行输入Hyprland启动即可
# function set_wayland_env
# {
# cd ${HOME}
# export LANG=zh_CN.UTF-8
# }

# function start_hyprland
# {
#  set_wayland_env
#  exec Hyprland
# }

# start_hyprland


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

## python的pyenv环境配置
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

source $ZSH/oh-my-zsh.sh

