#!/bin/bash

#

function DirIsTrue() {
	a=$(find "$HOME/.config" -name nvim)
	if [ "$a" = "" ]; then
		mkdir $HOME/.config/nvim
		echo '文件夹创建成功！'
	else
		echo '文件夹已存在！'
	fi
}

function CopyOptions() {
	cp -r ./* "$HOME/.config/nvim"
	echo ‘'配置文件已复制！'
}

function InstallLsp() {
	echo 'y' | sudo pacman -S npm go pyright bash-language-server >/dev/null
}

DirIsTrue

CopyOptions

read -p "是否下载npm和lsp依赖？(y/n)" shure

if [ "$shure" = "y" ]; then
	InstallLsp
fi
