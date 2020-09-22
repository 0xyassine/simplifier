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
printf "${RED}[+] Installing shodan_eye , please wait ... \n${GREEN}"
git clone https://github.com/BullsEye0/shodan-eye.git /opt/shodan
pip3 install -r /opt/shodan/requirements.txt
echo '#!/bin/bash' > /usr/local/bin/shodan_eye
echo 'python3 /opt/shodan/shodan_eye.py' >> /usr/local/bin/shodan_eye
chmod +x /usr/local/bin/shodan_eye
