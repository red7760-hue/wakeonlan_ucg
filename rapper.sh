#!/bin/bash
chmod +x addmacs.sh
chmod +x addcron.sh
chmod +x install_packages.sh
chmod +x check_etherwake.sh
chmod +x verfi_cron.sh
#move log file setup
mv wol_check /etc/logrotate.d/
#move files for checking etherwake is install or not 
mv check-etherwake.service /etc/systemd/system/
systemctl enable check-etherwake.service
systemctl start check-etherwake.service
#move files for croncheck
mv check-cron.service /etc/systemd/system/
systemctl enable check-cron.service
systemctl start check-cron.service
/root/install_packages.sh
/root/addcron.sh
