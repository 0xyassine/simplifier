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
printf "${RED}[+] Installing padbuster , please wait ... \n${GREEN}"
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
