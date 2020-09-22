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
printf "${RED}[+] Installing seclists , please wait ... \n${GREEN}"
mkdir /usr/share/wordlists
git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/seclist
curl -L 'https://www.scrapmaker.com/data/wordlists/dictionaries/rockyou.txt' > /usr/share/wordlists/rockyou.txt
