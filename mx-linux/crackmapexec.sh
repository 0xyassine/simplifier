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
printf "${RED}[+] Installing crackmapexec , please wait ... \n${GREEN}"
pip3 install gevent==1.2.0
pip install gevent==1.2.0
apt-get install python3-dev -y
pip install cme
pip install setuptools
pip3 install setuptools
pip3 install cme
apt-get install -y libssl-dev libffi-dev python-dev build-essential
git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec /opt/CrackMapExec
cd /opt/CrackMapExec/
pip3 install -r requirements.txt
python3 setup.py install
