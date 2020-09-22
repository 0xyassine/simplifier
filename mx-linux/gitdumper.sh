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
printf "${RED}[+] Installing git-dumper , please wait ... \n${GREEN}"
git clone https://github.com/arthaud/git-dumper.git /opt/git-dumper
pip3 install -r /opt/git-dumper/requirements.txt
echo '#!/bin/bash' > /usr/bin/git-dumper
echo 'python3 /opt/git-dumper/git-dumper.py "$@"' >> /usr/bin/git-dumper
chmod +x /usr/bin/git-dumper
