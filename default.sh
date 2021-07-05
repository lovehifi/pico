#!/bin/busybox ash
. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions
useBusybox
TARGET=`cat /etc/sysconfig/backup_device`
#cd /mnt/$TARGET
cd /tmp
wget https://raw.githubusercontent.com/lovehifi/pico/main/slimserver.tar.gz
wget https://raw.githubusercontent.com/lovehifi/pico/main/pcpm.tar.gz
sudo tar -zxf slimserver.tar.gz --overwrite -C /
sudo tar -zxf pcpm.tar.gz --overwrite -C /
pcp_write_var_to_config USER_COMMAND_3 "/mnt/mmcblk0p2/tce/pcpm.sh"
echo "Rebooting..."
sleep 3
pcp br
