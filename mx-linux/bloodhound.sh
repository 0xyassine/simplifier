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
printf "${RED}[+] Installing bloodhound , please wait ... \n${GREEN}"
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
echo "deb http://archive.debian.org/debian/ jessie-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/jessie-backports.list
echo "deb-src http://archive.debian.org/debian/ jessie-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/jessie-backports.list
echo 'Acquire::Check-Valid-Until no;' > /etc/apt/apt.conf.d/99no-check-valid-until
apt update
apt-get install apt-transport-https
apt --fix-broken install -y
apt install neo4j -y
apt install npm -y
apt install nodejs -y
npm install -g electron-packager
git clone https://github.com/BloodHoundAD/Bloodhound /opt/Bloodhound
cd /opt/Bloodhound/
npm install
npm run linuxbuild
echo '#!/bin/bash' > /usr/local/bin/bloodhound
echo 'neo4j start' >> /usr/local/bin/bloodhound
echo '/opt/Bloodhound/BloodHound-linux-x64/BloodHound --no-sandbox' >> /usr/local/bin/bloodhound
chmod +x /usr/local/bin/bloodhound
