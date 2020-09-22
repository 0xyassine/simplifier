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
printf "${RED}[+] Installing python libraries , please wait ... \n${GREEN}"
apt update
apt install python-pip python3-pip -y
pip3 install stegcracker
pip3 install pyfiglet
pip3 install stegcracker
pip install gmpy
pip3 install gmpy
pip3 install ecdsa
pip3 install dulwich
pip3 install pika
pip install impacket
pip install smtp-user-enum
pip3 install ldap3==2.8.1
pip3 install pyasn1==0.4.6
pip install setuptools
pip install impacket
pip3 install impacket
pip3 install gevent==1.2.0
pip install gevent==1.2.0
pip install cme
pip3 install cme
apt install python3-gmpy2 -y
