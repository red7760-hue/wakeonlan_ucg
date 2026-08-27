#!/bin/bash
#chmod
chmod +x addmacs.sh
chmod +x addcron.sh
chmod +x install_packages.sh
chmod +x check_etherwake.sh
# Cron job commands
CRON_JOB="* * * * * /root/addmacs.sh >> /var/log/wol_check.log 2>&1"
CRON_JOB2="0 6 * * * apt update && apt install -y etherwake >> /var/log/etherwake_install.log 2>&1"
 
# Check if the cron jobs already exist in the crontab
(crontab -l | grep -v -F "$CRON_JOB" | grep -v -F "$CRON_JOB2") | crontab -
 
# Append the new cron jobs to the crontab
(crontab -l; echo "$CRON_JOB"; echo "$CRON_JOB2") | crontab -
 
echo "Cron job added: $CRON_JOB"
echo "Cron job added: $CRON_JOB2"
