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
printf "${RED}[+] Installing ghidra , please wait ... \n${GREEN}"
curl https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip -o /opt/ghidra.zip
unzip /opt/ghidra.zip -d /opt/ghidra
rm /opt/ghidra.zip
echo '#!/bin/bash' > /usr/local/bin/ghidra
echo "/opt/ghidra/ghidra_9.2.2_PUBLIC/ghidraRun" >> /usr/local/bin/ghidra
chmod +x /usr/local/bin/ghidra
