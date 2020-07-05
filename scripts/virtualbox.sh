#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing virtualbox , please wait ... \n${GREEN}"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
apt update
apt install -y dkms
apt install -y virtualbox virtualbox-ext-pack
printf "${GREEN}[+] Done ! \n"
