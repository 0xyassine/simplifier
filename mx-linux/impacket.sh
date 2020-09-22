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
printf "${RED}[+] Installing impacket , please wait ... \n${GREEN}"
git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
pip3 install ldap3==2.8.1
pip3 install pyasn1==0.4.6
pip install setuptools
pip install impacket
pip3 install impacket
pip install /opt/impacket/.
pip3 install /opt/impacket/.
