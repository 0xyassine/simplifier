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
printf "${RED}[+] Installing autorecon , please wait ... \n${GREEN}"
git clone https://github.com/Tib3rius/AutoRecon.git /opt/autorecon
pip3 install -r /opt/autorecon/requirements.txt
echo '#!/bin/bash' > /usr/bin/autorecon
echo 'python3 /opt/autorecon/src/autorecon/autorecon.py "$@"' >> /usr/bin/autorecon
chmod +x /usr/bin/autorecon
