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
printf "${RED}[+] Installing powershell , please wait ... \n${GREEN}"
apt install apt-transport-https -y
apt install ca-certificates -y 
apt install libssl1.1 -y
apt install libc6 -y 
apt install -y libgcc1 
apt install -y libgssapi-krb5-2 
apt install -y liblttng-ust0 
apt install -y libstdc++6
apt install -y zlib1g
apt install -y less
apt install -y curl
pip install smtp-user-enum
apt install locales -y
curl -L  https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/powershell-7.0.3-linux-x64.tar.gz -o /tmp/powershell.tar.gz
mkdir -p /opt/microsoft/powershell/7
tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
chmod +x /opt/microsoft/powershell/7/pwsh
ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
rm /tmp/powershell.tar.gz
