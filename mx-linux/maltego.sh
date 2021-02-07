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
printf "${RED}[+] Installing maltego , please wait ... \n${GREEN}"
curl -L 'https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.13.13462.deb' -o /tmp/maltego.deb
dpkg -i /tmp/maltego.deb
rm /tmp/maltego.deb
