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
printf "${RED}[+] Installing kali tools , please wait ... \n${GREEN}"
apt update #update system
apt install btscanner -y
apt install nmap -y
apt install dirb -y
apt install tree -y
#apt install gobuster -y
#go get github.com/OJ/gobuster
apt install nikto -y
apt install jd-gui -y
apt install sshpass -y
apt install terminator -y
apt install hashcat -y
apt install openvpn -y
apt install plink -y
apt install steghide -y
apt install thunderbird -y
apt install ffmpeg -y
gem install winrm winrm-fs stringio
gem install evil-winrm
gem install wpscan
apt install sqlmap -y
apt install cme -y
apt install jekyll -y
apt install libmemcached-tools -y
apt install deluge -y
apt install knockd -y
apt install kpcli -y
apt install jxplorer -y
apt install vlc -y
apt install rlwrap -y
apt install docker.io -y
apt install terminator -y
apt install hydra -y
apt install xclip -y
apt install cherrytree -y
apt install wfuzz -y
apt install net-tools -y
apt install filezilla -y
apt install tcpdump -y
apt install wireshark -y
apt install cewl -y
apt install snapd -y
snap install p3x-onenote
apt install adapta-gtk-theme -y
apt install youtube-dl-gui -y
apt install crunch -y
apt install dos2unix -y
apt install axel -y
apt install ltrace -y
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash
usermod -a -G rvm `whoami`
source /etc/profile.d/rvm.sh
rvm requirements
