#!/bin/bash

while true
do
    time=$(date);
    interface="eth0";
    if ip link show "$interface" | grep -q "state UP"; then
        echo  "[${time}] ${interface}: Online" >> /var/log/check_online.log;
    elif ip link show "$interface" | grep -q "state DOWN"
        echo "[${time}] ${interface}: Offline" >> /var/log/check_online.log;
    fi
    interface="wlan0";
    if ip link show "$interface" | grep -q "state UP"; then
        echo "[${time}] ${interface}: Online" >> /var/log/check_online.log;
    elif ! ip link show "$interface" | grep -q "state DOWN"; then
        echo "[${time}] ${interface}: Offline" >> /var/log/check_online.log;
    fi
    
    sleep 5;
done
