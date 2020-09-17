#!/bin/bash
#created by YaSsInE
#run as root only
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

apt update #update system
apt upgrade -y #upgrade tools
apt upgrade --fix-missing -y
#installing tools
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
apt-get install lightdm -y
apt -y install task-gnome-desktop
dpkg-reconfigure lightdm
apt install btscanner -y 
apt install php -y
apt install git -y
apt install python-pip python3-pip -y
apt install nmap -y
apt install dirb -y
apt install tree -y
apt install gobuster -y
apt install nikto -y
apt install gem -y
apt install ruby -y
apt install jd-gui -y
apt install sshpass -y
apt install terminator -y
apt install hashcat -y
apt install openvpn -y
pip3 install stegcracker
apt install plink -y
apt install steghide -y
apt install thunderbird -y
apt install ffmpeg -y
pip3 install pyfiglet
pip3 install stegcracker
pip install gmpy
pip3 install gmpy
pip3 install ecdsa
apt install python3-gmpy2 -y
apt install g++ -y
gem install winrm winrm-fs stringio
gem install evil-winrm
gem install wpscan
apt install sqlmap -y
apt install cme -y
apt install jekyll -y
pip3 install dulwich
pip3 install pika
apt install libmemcached-tools -y
pip install impacket
apt install deluge -y
apt install knockd -y
apt install kpcli -y
apt install jxplorer -y
apt install vlc -y
apt install rlwrap -y
apt install golang-go -y
apt install docker.io -y
apt install terminator -y
apt install hydra -y
apt install xclip -y
service docker start
docker pull ymuski/curl-http3
docker pull charliedean07/winpayloads:latest
docker pull b4den/rsacrack
#to do
#veil

#anonsurf
git clone https://github.com/Und3rf10w/kali-anonsurf.git /opt/anon
rm -f /etc/apt/sources.list.d/i2p.list
# Compile the i2p ppa
echo "deb http://deb.i2p2.no/ unstable main" > /etc/apt/sources.list.d/i2p.list # Default config reads repos from sources.list.d
wget https://geti2p.net/_static/i2p-debian-repo.key.asc -O /tmp/i2p-debian-repo.key.asc # Get the latest i2p repo pubkey
apt-key add /tmp/i2p-debian-repo.key.asc # Import the key
rm /tmp/i2p-debian-repo.key.asc # delete the temp key
apt-get update # Update repos
apt install libservlet3.0-java -y
curl -L 'http://ftp.us.debian.org/debian/pool/main/j/jetty8/libjetty8-java_8.1.16-4_all.deb' -o /tmp/java.deb
dpkg -i /tmp/java.deb
rm /tmp/java.deb
apt -y install libecj-java libgetopt-java libservlet3.0-java  ttf-dejavu i2p i2p-router libjbigi-jni
curl -L 'http://ftp.us.debian.org/debian/pool/main/g/glassfish/glassfish-javaee_2.1.1-b31g+dfsg1-2_all.deb' -o /tmp/glass.deb
dpkg -i /tmp/glass.deb
apt-get -f install
rm /tmp/glass.deb
apt install -y i2p-keyring
apt install -y secure-delete tor i2p
dpkg-deb -b /opt/anon/kali-anonsurf-deb-src/ /tmp/kali-anonsurf.deb
dpkg -i /tmp/kali-anonsurf.deb || (apt-get -f install && dpkg -i /tmp/kali-anonsurf.deb)
rm /tmp/kali-anonsurf.deb


#john
git clone https://github.com/openwall/john.git /opt/john
/opt/john/src/configure
cd /opt/john/src 
make -s clean && make -sj4
echo '#!/bin/bash' > /usr/bin/john
echo '/opt/john/run/john "$@"' >> /usr/bin/john
chmod +x /usr/bin/john
curl 'https://raw.githubusercontent.com/stricture/hashstack-server-plugin-jtr/master/scrapers/sshng2john.py' > /opt/john/run/sshng2john.py
cd $DIR

#mysql
apt install gnupg -y
curl -L 'https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb' -o /tmp/mysql.deb
dpkg -i /tmp/mysql.deb
rm /tmp/mysql.deb
apt update
apt install mysql-client -y

#metasploit
curl 'https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb' -o /tmp/msfinstall
chmod +x /tmp/msfinstall
bash /tmp/msfinstall
rm /tmp/msfinstall

#searchsploit
git clone https://github.com/offensive-security/exploitdb.git /opt/searchsploit
ln -s /opt/searchsploit/searchsploit /usr/bin/searchsploit
chmod +x /usr/bin/searchsploit

#seclist
mkdir /usr/share/wordlists
git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/seclist
curl -L 'https://www.scrapmaker.com/data/wordlists/dictionaries/rockyou.txt' > /usr/share/wordlists/rockyou.txt

#jd-gui
echo '#!/bin/bash' > /usr/bin/jd-gui
echo 'java -jar /opt/jd-gui/jd-gui.jar' >> /usr/bin/jd-gui
chmod +x /usr/bin/jd-gui

#bloodhound
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
echo "deb http://archive.debian.org/debian/ jessie-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/jessie-backports.list
echo "deb-src http://archive.debian.org/debian/ jessie-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/jessie-backports.list
echo 'Acquire::Check-Valid-Until no;' > /etc/apt/apt.conf.d/99no-check-valid-until
apt update
#curl 'http://ftp.cn.debian.org/debian/pool/main/g/giflib/libgif4_4.1.6-11+deb8u1_amd64.deb' -o /tmp/lib.deb -L
#dpkg -i /tmp/lib.deb
#rm /tmp/lib.deb
#curl 'http://ftp.us.debian.org/debian/pool/main/libp/libpng/libpng3_1.2.50-2+deb8u3_amd64.deb' -o /tmp/lib.deb
#dpkg -i /tmp/lib.deb
#rm /tmp/lib.deb
#apt install -y openjdk-8-jdk openjdk-8-jre
apt --fix-broken install -y
apt install neo4j -y
echo "dbms.active_database=graph.db" >> /etc/neo4j/neo4j.conf
echo "dbms.connector.http.address=0.0.0.0:7474" >> /etc/neo4j/neo4j.conf
echo "dbms.connector.bolt.address=0.0.0.0:7687" >> /etc/neo4j/neo4j.conf
echo "dbms.allow_format_migration=true" >> /etc/neo4j/neo4j.conf
git clone https://github.com/adaptivethreat/BloodHound.git /opt/bloodhound
mkdir /var/lib/neo4j/data/databases/graph.db
cp -R /opt/bloodhound/BloodHoundExampleDB.db/* /var/lib/neo4j/data/databases/graph.db
curl -L 'https://github-production-release-asset-2e65be.s3.amazonaws.com/56452110/8c0bc480-cbfc-11ea-820c-dd646d9059ea?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200911%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200911T160854Z&X-Amz-Expires=300&X-Amz-Signature=02068860704f13c636c5c001b0660351ab729fda91e2cfb1a490e5807842543d&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=56452110&response-content-disposition=attachment%3B%20filename%3DBloodHound-linux-x64.zip&response-content-type=application%2Foctet-stream' -o /opt/blood.zip
unzip /opt/blood.zip -d /opt
echo '#!/bin/bash' > /usr/bin/bloodhound
echo '/opt/BloodHound-linux-x64/BloodHound --no-sandbox' >> /usr/bin/bloodhound
chmod +x /usr/bin/bloodhound

#padbuster
git clone https://github.com/AonCyberLabs/PadBuster.git /opt/padbuster 
echo "install LWP::UserAgent" | cpan 
echo "install strict" | cpan
echo "install warnings" | cpan
echo "install Getopt::Std" | cpan
echo "install MIME::Base64" | cpan
echo "install URI::Escape" | cpan
echo "install Getopt::Long" | cpan
echo "install Time::HiRes" | cpan
echo "install Compress::Zlib" | cpan
apt install libcrypt-ssleay-perl -y
echo '#!/bin/bash' > /usr/bin/padbuster
echo 'perl /opt/padbuster/padBuster.pl "$@"' >> /usr/bin/padbuster
chmod +x /usr/bin/padbuster

#burpsuit
curl 'https://portswigger.net/burp/releases/download?product=community&version=2020.9.1&type=Linux' --output /tmp/burpsuite.sh -L
chmod +x /tmp/burpsuite.sh
bash /tmp/burpsuite.sh
rm /tmp/burpsuite.sh
echo '#!/bin/bash' > /usr/bin/burpsuite
echo '/opt/BurpSuiteCommunity/BurpSuiteCommunity' >> /usr/bin/burpsuite
chmod +x /usr/bin/burpsuite

#powershell
apt install apt-transport-https -y
apt install ca-certificates -y 
apt install libssl1.1 -y
apt install libc6 -y 
apt install -y libgcc1 
apt install -y libgssapi-krb5-2 
apt install -y liblttng-ust0 
apt install -y libstdc++6
apt install -y zlib1g
apt install -y less
apt install -y curl
pip install smtp-user-enum
apt install locales -y
curl -L  https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/powershell-7.0.3-linux-x64.tar.gz -o /tmp/powershell.tar.gz
mkdir -p /opt/microsoft/powershell/7
tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
chmod +x /opt/microsoft/powershell/7/pwsh
ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
rm /tmp/powershell.tar.gz

#dotdotpwn
apt install perl -y
echo "yes" |perl -MCPAN -e "install HTTP::Lite"
echo "install Net::FTP" | cpan
echo "yes" |perl -MCPAN -e "install TFTP"
echo "install Time::HiRes" | cpan
echo "yes" |perl -MCPAN -e "install Socket"
echo "install IO::Socket" | cpan
echo "yes" |perl -MCPAN -e "install Getopt::Std"
echo "yes" |perl -MCPAN -e "install Switch"
git clone https://github.com/wireghoul/dotdotpwn.git /opt/dotdotpwn
echo '#!/bin/bash' > /usr/bin/dotdotpwn
echo 'cd /opt/dotdotpwn/ && ./dotdotpwn.pl "$@"' >> /usr/bin/dotdotpwn
chmod +x /usr/bin/dotdotpwn

#auto recon
git clone https://github.com/Tib3rius/AutoRecon.git /opt/autorecon
pip3 install -r /opt/autorecon/requirements.txt
echo '#!/bin/bash' > /usr/bin/autorecon
echo 'python3 /opt/autorecon/src/autorecon/autorecon.py "$@"' >> /usr/bin/autorecon
chmod +x /usr/bin/autorecon

#impacket
git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
pip3 install ldap3==2.8.1
pip3 install pyasn1==0.4.6
pip install /opt/impacket/.

#git dumper
git clone https://github.com/arthaud/git-dumper.git /opt/git-dumper
pip3 install -r /opt/git-dumper/requirements.txt
echo '#!/bin/bash' > /usr/bin/git-dumper
echo 'python3 /opt/git-dumper/git-dumper.py "$@"' >> /usr/bin/git-dumper
chmod +x /usr/bin/git-dumper

#ridenum
git clone https://github.com/trustedsec/ridenum.git /opt/ridenum

#ysoserial
mkdir /opt/ysoserial
curl -L 'https://jitpack.io/com/github/frohoff/ysoserial/master-6eca5bc740-1/ysoserial-master-6eca5bc740-1.jar' -o /opt/ysoserial/ysoserial.jar

#crackmapexec
apt-get install -y libssl-dev libffi-dev python-dev build-essential
git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec /opt/CrackMapExec
pip3 install -r /opt/CrackMapExec/requirements.txt
python3 /opt/CrackMapExec/setup.py install

#setoolkit
git clone https://github.com/trustedsec/social-engineer-toolkit/ /opt/setoolkit/
pip3 install -r /opt/setoolkit/requirements.txt
cd /opt/setoolkit/ && python setup.py
cd $DIR
