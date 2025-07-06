# check_online-daemon
A simple first linux daemon to check if the eth0 and wlan0 NIC interfaces are up and write that data to a log.


## USAGE

Once these files are downloaded
1. Mark script as executable: `chmod +x check_online.sh`
2. Move the bash script to `/usr/local/bin`, using this command : `mv check_online.sh /usr/local/bin`
3. Move `check_online.service` to `/etc/systemd/system`, this requires root privileges:
   1. `sudo su`
   2. `mv check_online.service /etc/systemd/system`
5. Now we can enable and start our service:
   1. To enable daemon: `systemctl enable check_online`
   2. To start our service: `systemctl start check_online`
6. If you want to stop or disable daemon:
   1. To stop daemon process: `systemctl stop check_online`
   2. To prevent daemon from starting on boot: `systemctl disable check_online`
