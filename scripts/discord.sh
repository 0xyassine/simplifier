#!/bin/bash
#by YaSsInE

trap ctrl_c INT
function ctrl_c() {
    printf "${RED}[-] Canceled by user \n"
    rm /tmp/discord.deb
    exit
}
RED='\033[0;31m'
GREEN='\033[0;32m'
printf "${RED}[+] Installing discrod , please wait ... \n${GREEN}"
curl -L 'https://discordapp.com/api/download?platform=linux&format=deb' > /tmp/discord.deb
dpkg -i /tmp/discord.deb
apt install -f -y
rm /tmp/discord.deb
printf "${GREEN}[+] Done ! \n"
