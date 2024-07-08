#!/bin/bash

belongUser=$(ls -l "/opt/visual-studio-code/resources/app/out/vs/workbench/workbench.desktop.main.css" | awk '{print $3}')
if [[ "$(whoami)" != root ]]; then
	echo "The script was not initiated by root!"
	exit 0
fi

if [ "$belongUser" == "root" ]; then
	echo 'y' | chmod +rwx /opt/visual-studio-code/resources/app/out/vs/workbench/workbench.desktop.main.css
	echo 'y' | chmod +rwx /opt/visual-studio-code/resources/app/out/vs/workbench/workbench.desktop.main.js
	echo 'y' | chown -R Azucar:Azucar /opt/visual-studio-code/resources/app/out/vs/workbench/*
	echo 'update completed to VSCode config !'
fi

echo "Nothing happened!"
