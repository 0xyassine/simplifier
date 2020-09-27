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
printf "${RED}[+] Installing microsoft team , please wait ... \n${GREEN}"
curl -L 'https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.16851_amd64.deb' -o /tmp/team.deb
dpkg -i /tmp/team.deb
rm /tmp/team.deb
