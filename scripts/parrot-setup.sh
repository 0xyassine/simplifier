#!/bin/bash
#by YaSsInE
#top parrot tools

#run as root only
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi
apt update
#apt upgrade -y
#enable this for nvidia
#apt install -y nvidia-driver nvidia-cuda-toolkit nvidia-smi
#vlc
apt install vlc -y
#tools
apt install latte-dock -y
gem install evil-winrm
apt install cherrytree -y
apt install terminator -y
#seclist
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
mv SecList.zip /usr/share/
unzip /usr/share/SecList.zip
rm -f /usr/share/SecList.zip
apt install crackmapexec -y
apt install jxplorer -y
apt install dotdotpwn -y
apt install jd-gui -y
gzip -d /usr/share/wordlists/rockyou.txt.gz
apt install exploitdb -y
apt install gobuster -y
apt install docker.io -y
service docker start
docker pull ymuski/curl-http3
docker pull charliedean07/winpayloads:latest
docker pull b4den/rsacrack
apt install powershell -y
apt install smtp-user-enum -y
apt install padbuster -y
apt install kpcli -y
apt install knockd -y
apt install python-pip -y
apt install python3-pip -y
apt install golang-go -y
#apt install gnome-core kali-defaults kali-root-login desktop-base -y
#apt install kali-defaults kali-root-login desktop-base kde-plasma-desktop -y
#update-alternatives --config x-session-manager
apt install deluge -y
apt install wpscan -y
pip3 install stegcracker
pip3 install flask_httpauth
pip install flask_httpauth
pip3 install altgraph
apt install bloodhound -y
apt install rlwrap -y
pip3 install pyfiglet
apt install veil-evasion -y
apt install ffmpeg -y
pip install gmpy
pip3 install gmpy
pip3 install ecdsa
pip install ecdsa
apt install python3-gmpy2 -y
apt install jekyll -y
pip3 install dulwich
apt install libmemcached-tools -y
#gitlab
apt-get install -y postfix
pip3 install pika
apt install gimp -y
pip install impacket
apt install libguestfs-tools -y
apt install cifs-utils -y
apt install sshpass -y
apt install plink -y
