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
printf "${RED}[+] Installing john , please wait ... \n${GREEN}"

git clone https://github.com/openwall/john.git /opt/john
apt install libssl-dev -y
cd /opt/john/src
bash /opt/john/src/configure 
make -s clean && make -sj4
echo '#!/bin/bash' > /usr/bin/john
echo '/opt/john/run/john "$@"' >> /usr/bin/john
chmod +x /usr/bin/john
curl 'https://raw.githubusercontent.com/stricture/hashstack-server-plugin-jtr/master/scrapers/sshng2john.py' > /opt/john/run/sshng2john.py

