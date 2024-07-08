#!/bin/bash

belongUser=$(ls -l "/opt/visual-studio-code/resources/app/out/vs/workbench/workbench.desktop.main.css" | awk '{print $3}')
belongUser2=$(ls -l "/opt/visual-studio-code/resources/app/product.json" | awk '{print $3}')
if [[ "$(whoami)" != root ]]; then
    echo "The script was not initiated by root!"
    exit 0
fi

if ( (("$belongUser" == "root")) && (("$belongUser2" == "root"))); then
    echo 'y' | chmod +rwx /opt/visual-studio-code/resources/app/out/vs/workbench/workbench.desktop.main.css
    echo 'y' | chmod +rwx /opt/visual-studio-code/resources/app/out/vs/workbench/workbench.desktop.main.js
    echo 'y' | chmod +rwx /opt/visual-studio-code/resources/app/product.json
    echo 'y' | chown -R Azucar:Azucar /opt/visual-studio-code
    echo 'update completed to VSCode config !'
fi

echo "Nothing happened!"
