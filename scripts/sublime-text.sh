#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing sublime-text , please wait ... \n${GREEN}"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
apt install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt update
apt install sublime-text -y
printf "${GREEN}[+] Done ! \n"
