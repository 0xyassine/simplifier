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
printf "${RED}[+] Installing setoolkit , please wait ... \n${GREEN}"
git clone https://github.com/trustedsec/social-engineer-toolkit/ /opt/setoolkit/
cd /opt/setoolkit/
pip3 install -r /opt/setoolkit/requirements.txt
python /opt/setoolkit/setup.py
