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
printf "${RED}[+] Installing dotdotpwn , please wait ... \n${GREEN}"
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
