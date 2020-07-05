#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    rm google-chrome-stable_current_amd64.deb
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing chrome , please wait ... \n${GREEN}"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
apt install -y -f
rm google-chrome-stable_current_amd64.deb
printf "${GREEN}[+] Done ! \n"
