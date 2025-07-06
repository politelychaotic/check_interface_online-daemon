function check_interface 
{
    #set -o pipefail;
    /sbin/ethtool "$1" | grep -q "link detected: yes";
}

if check_interface eth0; then
    echo "eth0: Online" > /var/log/check_online.log;
elif !check_interface; then
    echo "eth0: Offline" > /var/log/check_online.log;
fi

if check_interface wlan0; then
    echo "wlan0: Online" > /var/log/check_online.log;
elif !check_interface wlan0; then
    echo "wlan0: Offline" > /var/log/check_online.log;
fi
    
