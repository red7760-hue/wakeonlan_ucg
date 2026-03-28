The scripts purpose is to install wakeonlan on a UCG router.

 Steps for Installing

Download the files and edit the addmacs.sh file via Notepad and adjust the line for server ip and kiosk ip. If there's more then one device just add another line in the next to the last device. Then save to the same file. 
![notepad++_6I0ZBDHmtI](https://github.com/user-attachments/assets/60b07478-23f3-4b4d-a3fc-95e810cf2b3f)


Install Putty and login to the UCG Router

Run the below commands 
- sudo add-apt-repository ppa:git-core/ppa
- sudo apt update; sudo apt install git
- git clone https://github.com/red7760-hue/wakeonlan_ucg.git
- mv wakeonlan_ucg/* wakeonlan_ucg/.[!.]* /root/
- If installing via github - Dont forget to edit the addmac file for the devices you want to wake up - edit the IP and Mac for the specified devices.
- ./rapper.sh


Wait one minute and confirm this was all ran correctly run the below command to check the logs 
- cat /var/log/wol_check.log 
Below should be the output. 
