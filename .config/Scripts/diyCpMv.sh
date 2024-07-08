#!/bin/bash

# cp，mv命令加上进度条。
# ############

function thisCopy() {
    cp -r "$1" "$2" &
    progress -mp $!
}

function thisMove() {
    mv -r "$1" "$2" &
    progress -mp $!
}

function startScript() {
    case "$1" in
    "1")
        thisCopy "$2" "$3"
        ;;
    "2")
        thisMove "$2" "$3"
        ;;
    *)
        echo "not type !"
        ;;
    esac
}

startScript "$1" "$2" "$3"
