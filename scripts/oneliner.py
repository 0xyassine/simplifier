#!/usr/bin/python3
#developed by YaSsInE
from optparse import OptionParser
import sys
import signal
from colorama import Fore,Style

parser = OptionParser(description="Python script to remove spaces and/or new lines from a given file")

def signal_handler(sig, frame):
    print(Fore.GREEN+'\nThank you for using my tool !! See you soon ...')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

def options():
	#parser = argparse.ArgumentParser(description='Python script to remove spaces and/or new lines from a given file')
	parser.add_option('-f', '--file',dest="file",help="file to be analyzed")
	parser.add_option('-o', '--option',dest="option",help="option to be used: [space | line | all]")
	option, args = parser.parse_args()
	if not option.file:
		print("[-] Please use -h for help")
	elif not option.option:
		print("[-] Please use -h for help")
	return option

def read_file(file ,opt):
	a = ''
	try:
		with open(file, 'r') as infile:
			for myline in infile:
				if opt == "space":
					output = myline.replace(' ', '')
					a = a + output
				elif opt == "line":
					output = myline.strip()
					a = a+ output
				elif opt == "all":
					output = myline.strip()
					output = output.replace(' ', '')
					a = a+ output
		return a
	except IOError:
		print (Fore.RED+"[-] error opening file . If the file is not in the same working directoy , please use the full path")

op = options()
if op.file:
	b = read_file(op.file,op.option)
if op.option == "space" and op.file:
	if b:
		print(Fore.GREEN+b)
elif op.option == "line" and op.file:
	if b:
		print(Fore.GREEN+b)
elif op.option == "all" and op.file:
	if b:
		print(Fore.GREEN+b)
else:
	if op.file and op.option:
		print(Fore.RED+"[-] Please select a correct option value , use -h for help")
