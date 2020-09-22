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
printf "${RED}[+] Installing searchsploit , please wait ... \n${GREEN}"
git clone https://github.com/offensive-security/exploitdb.git /opt/searchsploit
ln -s /opt/searchsploit/searchsploit /usr/bin/searchsploit
chmod +x /usr/bin/searchsploit
