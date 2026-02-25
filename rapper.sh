#!/bin/bash
chmod +x addmacs.sh
chmod +x addcron.sh
chmod +x install_packages.sh
chmod +x check_etherwake.sh
mv wol_check /etc/logrotate.d/
mv check-etherwake.service /etc/systemd/system/
systemctl enable check-etherwake.service
systemctl start check-etherwake.service
/root/install_packages.sh
/root/addcron.sh
