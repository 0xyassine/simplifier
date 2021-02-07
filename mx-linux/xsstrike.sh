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
printf "${RED}[+] Installing XSStrike , please wait ... \n${GREEN}"
git clone https://github.com/s0md3v/XSStrike.git /opt/XSStrike
pip3 install -r /opt/XSStrike/requirements.txt
echo '#!/bin/bash' > /usr/local/bin/xsstrike
echo 'python3 /opt/XSStrike/xsstrike.py "$@"' >> /usr/local/bin/xsstrike
chmod +x /usr/local/bin/xsstrike
