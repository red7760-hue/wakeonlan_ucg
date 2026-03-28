The scripts purpose is to install wakeonlan on a UCG router. It does the below tasks some of these were added due to updates on the UCG removing crontab -e and etherwake dependencies.
- It pings the devices added to the addmac.sh file.
- If the pings fail to these devices it crosschecks the mac address added in the addmac.sh file as well.
- If the ARP check is successful a etherwake packet is not sent if the ARP check is not successful it sends a etherwake packet.
- In the crontab its set to ping and check the arp table for the devices in the addmac.sh file every 1 minute. This can be adjusted in crontab -e as needed.

Steps for Installing

Install Putty and login to the UCG Router

Run the below commands 
- sudo add-apt-repository ppa:git-core/ppa
- sudo apt update; sudo apt install git
- git clone https://github.com/red7760-hue/wakeonlan_ucg.git
- mv wakeonlan_ucg/* wakeonlan_ucg/.[!.]* /root/
- If installing via github - Dont forget to edit the addmac file for the devices you want to wake up - edit the IP and Mac for the specified devices.
  ![notepad++_6I0ZBDHmtI](https://github.com/user-attachments/assets/60b07478-23f3-4b4d-a3fc-95e810cf2b3f)
- ./rapper.sh


Wait one minute and confirm this was all ran correctly run the below command to check the logs 
- cat /var/log/wol_check.log 
Below should be the output. 
<img width="1091" height="107" alt="image" src="https://github.com/user-attachments/assets/19b4a7d6-31e2-4dd4-8a53-8af0e6be79a8" />
