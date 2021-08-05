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
printf "${RED}[+] Installing torghost , please wait ... \n${GREEN}"
git clone https://github.com/SusmithKrishnan/torghost.git /opt/torghost
pip install -r /opt/torghost/requirements.txt
pip install packaging
ln -s /opt/torghost/torghost.py /usr/local/bin/torghost.py
chmod +x /usr/local/bin/torghost.py
