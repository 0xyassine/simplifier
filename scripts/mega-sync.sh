#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    rm megasync-Debian_10.0_amd64.deb
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing virtualbox , please wait ... \n${GREEN}"
wget https://mega.nz/linux/MEGAsync/Debian_10.0/amd64/megasync-Debian_10.0_amd64.deb
dpkg -i megasync-Debian_10.0_amd64.deb
apt install -f -y
rm megasync-Debian_10.0_amd64.deb
printf "${GREEN}[+] Done ! \n"
