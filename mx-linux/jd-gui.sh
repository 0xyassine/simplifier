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
printf "${RED}[+] Installing jd-gui , please wait ... \n${GREEN}"
mkdir /opt/jd-gui
curl -L 'https://gitlab.com/kalilinux/packages/jd-gui/-/raw/kali/master/jd-gui-1.6.3-min.jar?inline=false' > /opt/jd-gui/jd-gui.jar
echo '#!/bin/bash' > /usr/bin/jd-gui
echo 'java -jar /opt/jd-gui/jd-gui.jar' >> /usr/bin/jd-gui
chmod +x /usr/bin/jd-gui

