#!/bin/bash

function check_interface 
{
    set -o pipefail;
    ip link show "$1" | grep -q "state UP";
}

while true
do
    time=$(date);
    interface="eth0";
    if check_interface "$interface"; then
        echo  "[${time}] ${interface}: Online" >> /var/log/check_online.log;
    elif ! check_interface "$interface"; then
        echo "[${time}] ${interface}: Offline" >> /var/log/check_online.log;
    fi
    interface="wlan0";
    if check_interface "$interface"; then
        echo "[${time}] ${interface}: Online" >> /var/log/check_online.log;
    elif ! check_interface "$interface"; then
        echo "[${time}] ${interface}: Offline" >> /var/log/check_online.log;
    fi
    
    sleep 5;
done
