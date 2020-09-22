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
printf "${RED}[+] Installing wafw00f , please wait ... \n${GREEN}"
git clone https://github.com/EnableSecurity/wafw00f.git /opt/waf
cd /opt/waf
python setup.py install
