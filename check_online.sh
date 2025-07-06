#!/bin/bash

function check_interface 
{
    set -o pipefail;
    /sbin/ethtool "$1" | grep -q "link detected: yes";
}
time=$(date);
if check_interface eth0; then
    echo  "[${time}] eth0: Online" >> /var/log/check_online.log;
elif ! check_interface eth0; then
    echo "[${time}] eth0: Offline" >> /var/log/check_online.log;
fi

time=$(date);
if check_interface wlan0; then
    echo "[${time}] wlan0: Online" >> /var/log/check_online.log;
elif ! check_interface wlan0; then
    echo "[${time}] wlan0: Offline" >> /var/log/check_online.log;
fi

sleep 5;
    
