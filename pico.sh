#!/bin/busybox ash
#sudo chmod -R 777 /tmp/active.sh && cd /tmp && sudo ./active.sh
. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions
useBusybox
#TARGET=`cat /etc/sysconfig/backup_device`
#cd /mnt/$TARGET
#echo pcp-aplayer_render.tcz >>onboot.lst
#cd optional
#wget https://raw.githubusercontent.com/sam0402/piCorePlayer-Album_Player/master/pcp-aplayer_render.tcz
#pcp_write_var_to_config USER_COMMAND_2 "aplayer;aprenderer"

cd /tmp
wget https://raw.githubusercontent.com/lovehifi/pico/main/MaterialSkin.tar.gz
wget https://raw.githubusercontent.com/lovehifi/pico/main/pcp-7.0.0-www.tcz
wget https://raw.githubusercontent.com/lovehifi/pico/main/slimserver.tcz
wget https://raw.githubusercontent.com/lovehifi/pico/main/pcpm.tar.gz

tar -zxf /tmp/MaterialSkin.tar.gz --overwrite -C /
tar -zxf /tmp/pcp-7.0.0-www.tcz --overwrite -C /
tar -zxf /tmp/slimserver.tcz --overwrite -C /
tar -zxf /tmp/pcpm.tar.gz --overwrite -C /

pcp_write_var_to_config USER_COMMAND_3 "/mnt/mmcblk0p2/tce/pcpm.sh"
echo "Rebooting..."
sleep 3
pcp br

#sudo filetool.sh -b && sudo reboot