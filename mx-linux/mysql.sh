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
printf "${RED}[+] Installing mysql , please wait ... \n${GREEN}"
apt update #update system
apt install gnupg -y
curl -L 'https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb' -o /tmp/mysql.deb
dpkg -i /tmp/mysql.deb
rm /tmp/mysql.deb
apt update
apt install mysql-client -y
