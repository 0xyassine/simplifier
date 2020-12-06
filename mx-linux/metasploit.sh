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
printf "${RED}[+] Installing metasploit , please wait ... \n${GREEN}"
curl 'https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb' -o /tmp/msfinstall
chmod +x /tmp/msfinstall
bash /tmp/msfinstall
rm /tmp/msfinstall
git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit
