#!/bin/bash
# Check if etherwake is installed, install if missing
if ! command -v etherwake &> /dev/null && [ ! -f /usr/sbin/etherwake ]; then
    echo "$(date): etherwake not found. Attempting to install..."
    if apt-get install -y etherwake; then
        echo "$(date): etherwake installed successfully."
    else
        echo "$(date): ERROR - Failed to install etherwake. Exiting."
        exit 1
    fi
fi

declare -A DEVICES=(
    ["10.10.8.8"]="D4:A2:CD:B8:1B:83"
    ["10.10.8.26"]="E8:CF:83:23:0D:E8"
)
#go through each device added in prev lines
for IP in "${!DEVICES[@]}"; do
    MAC="${DEVICES[$IP]}"
#check pings
    PING_OK=false
    if ping -c 1 -W 2 "$IP" > /dev/null 2>&1; then
        PING_OK=true
    fi
#check if mac is in arp table, macs automatically change to lowercase
	if ip neighbor | grep -qi "${MAC,,}.*REACHABLE"; then
    ARP_OK=true
	else
    ARP_OK=false
	fi
#decide wether ping/arps are ok
    if [ "$PING_OK" = false ] && [ "$ARP_OK" = false ]; then
        echo "$(date): Device $IP ($MAC) is offline and not in ARP table. Sending WoL..."
        if ip link show br0 > /dev/null 2>&1; then
            /usr/sbin/etherwake -i br0 "$MAC"
        else
            echo "$(date): ERROR - Interface br0 is not available. Skipping WoL for $IP."
        fi
    elif [ "$PING_OK" = false ] && [ "$ARP_OK" = true ]; then
        echo "$(date): Device $IP ($MAC) not pingable but still in ARP table — skipping WoL."
    else
        echo "$(date): Device $IP ($MAC) is online."
    fi
done