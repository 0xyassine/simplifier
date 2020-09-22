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
printf "${RED}[+] Installing ysoserial , please wait ... \n${GREEN}"
mkdir /opt/ysoserial
curl -L 'https://jitpack.io/com/github/frohoff/ysoserial/master-6eca5bc740-1/ysoserial-master-6eca5bc740-1.jar' -o /opt/ysoserial/ysoserial.jar
