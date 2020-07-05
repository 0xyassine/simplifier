#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    rm teamviewer_amd64.deb
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing teamviewer , please wait ... \n${GREEN}"
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
dpkg -i teamviewer_amd64.deb
apt install -f -y
rm teamviewer_amd64.deb
printf "${GREEN}[+] Done ! \n"
