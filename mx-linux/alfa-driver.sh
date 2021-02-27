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
printf "${RED}[+] Installing alfa driver , please wait ... \n${GREEN}"
apt install git build-essential libelf-dev linux-headers-`uname -r` debhelper dpkg-dev dkms bc -y
git clone https://github.com/aircrack-ng/rtl8812au /opt/rtl8812au
cd /opt/rtl8812au/
make dkms_install
