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
printf "${RED}[+] Installing gobuster , please wait ... \n${GREEN}"
git clone https://github.com/OJ/gobuster.git /opt/gobuster
cd /opt/gobuster
go get github.com/OJ/gobuster
go get && go build
go install
make linux
echo '#!/bin/bash' > /usr/local/bin/gobuster
echo '/opt/gobuster/build/gobuster-linux-amd64/gobuster "$@"' >> /usr/local/bin/gobuster
chmod +x /usr/local/bin/gobuster
