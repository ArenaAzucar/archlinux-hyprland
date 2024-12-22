#!/bin/bash

status=$(warp-cli status | grep 'Status update:' | awk '{print $3}')

if [ "$status" = "Connected" ]; then
	echo 'VPN'
fi
