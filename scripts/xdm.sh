#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    rm xdm-2018-x64.tar.xz
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing xdm , please wait ... \n${GREEN}"
wget https://netcologne.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
chmod +x install.sh
./install.sh
rm install.sh readme.txt xdm-2018-x64.tar.xz
printf "${GREEN}[+] Done ! \n"
