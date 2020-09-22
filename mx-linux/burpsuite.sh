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
printf "${RED}[+] Installing burpsuite , please wait ... \n${GREEN}"
curl 'https://portswigger.net/burp/releases/download?product=community&version=2020.9.1&type=Linux' --output /tmp/burpsuite.sh -L
chmod +x /tmp/burpsuite.sh
bash /tmp/burpsuite.sh
rm /tmp/burpsuite.sh
echo '#!/bin/bash' > /usr/local/bin/burpsuite
echo '/opt/BurpSuiteCommunity/BurpSuiteCommunity' >> /usr/local/bin/burpsuite
chmod +x /usr/local/bin/burpsuite
