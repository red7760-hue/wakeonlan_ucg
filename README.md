The scripts purpose is to install wakeonlan on a UCG router.

Steps for Installing
Edit the addmacs.sh file via Notepad and adjust the line for server ip and kiosk ip as seen below. If there's more then one device just add another line in the next to the last device. Then save to the same file. 

Run the below commands 
sudo -s 
chmod +x rapper.sh 
./rapper.sh 

Wait one minute and confirm this was all ran correctly run the below command to check the logs 
cat /var/log/wol_check.log 
Below should be the output. 
