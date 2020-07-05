#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing vscode , please wait ... \n${GREEN}"
apt install curl gpg software-properties-common apt-transport-https -y
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
apt update
apt install code -y
printf " ${GREEN}[+] Done ! \n"
