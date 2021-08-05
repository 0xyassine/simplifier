#!/bin/bash
#created by YaSsInE
#run as root only
if [ $(id -u) -ne 0 ]; then
        echo "This script must be ran as root"
        exit 1
fi

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing bettercap , please wait ... \n${GREEN}"
apt-get install build-essential libpcap-dev net-tools
git clone https://github.com/bettercap/bettercap.git /opt/bettercap
apt-get install libusb-1.0-0-dev -y
cd /opt/bettercap && make all && make install
