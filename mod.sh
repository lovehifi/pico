#!/bin/busybox ash
. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions
useBusybox
TARGET=`cat /etc/sysconfig/backup_device`
#cd /mnt/$TARGET
#echo pcp-aplayer_render.tcz >>onboot.lst
#cd optional
#wget https://raw.githubusercontent.com/sam0402/piCorePlayer-Album_Player/master/pcp-aplayer_render.tcz
cd /tmp
wget https://raw.githubusercontent.com/lovehifi/pico/main/pcp-7.0.0-www.tcz
wget https://raw.githubusercontent.com/lovehifi/pico/main/slimserver.tcz
wget https://raw.githubusercontent.com/lovehifi/pico/main/slimserver.tar.gz
wget https://raw.githubusercontent.com/lovehifi/pico/main/MaterialSkin.tar.gz
wget https://raw.githubusercontent.com/lovehifi/pico/main/pcpm.tar.gz
#wget https://raw.githubusercontent.com/lovehifi/pico/main/ap.tar.gz
mv /mnt/mmcblk0p2/tce/optional/pcp-7.0.0-www.tcz /mnt/mmcblk0p2/tce/optional/pcp-7.0.0-www_o.tcz
mv /mnt/mmcblk0p2/tce/optional/slimserver.tcz /mnt/mmcblk0p2/tce/optional/slimserver_o.tcz
sudo tar -zxf slimserver.tar.gz --overwrite -C /
sudo tar -zxf MaterialSkin.tar.gz --overwrite -C /
sudo tar -zxf pcpm.tar.gz --overwrite -C /
#sudo rm /home/tc/aplayer/aplayer
#sudo rm /home/tc/apmenu/apmenu
#sudo rm /home/tc/aprenderer/ap2renderer
sudo tar -zxf ap.tar.gz --overwrite -C /
mv /tmp/pcp-7.0.0-www.tcz /mnt/mmcblk0p2/tce/optional/
mv /tmp/slimserver.tcz /mnt/mmcblk0p2/tce/optional/
#pcp_write_var_to_config USER_COMMAND_1 "sleep 5;/home/tc/aplayer/aplayer.sh;/home/tc/apmenu/apmenu.sh;/home/tc/aprenderer/aprenderer.sh"
#pcp_write_var_to_config USER_COMMAND_2 "sleep 5;tidal.sh"
pcp_write_var_to_config USER_COMMAND_3 "/mnt/mmcblk0p2/tce/pcpm.sh"
mkdir /mnt/mmcblk0p2/tce/slimserver/prefs/material-skin
echo "Rebooting..."
sleep 3
pcp br

#sudo filetool.sh -b && sudo reboot
