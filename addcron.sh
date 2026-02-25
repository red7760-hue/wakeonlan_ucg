#!/bin/bash
#chmod
chmod +x addmacs.sh
chmod +x addcron.sh
chmod +x install_packages.sh
chmod +x check_etherwake.sh
# Cron job command
CRON_JOB="* * * * * /root/addmacs.sh >> /var/log/wol_check.log 2>&1"
 
# Check if the cron job already exists in the crontab
(crontab -l | grep -v -F "$CRON_JOB") | crontab -
 
# Append the new cron job to the crontab
(crontab -l; echo "$CRON_JOB") | crontab -
 
echo "Cron job added: $CRON_JOB"
