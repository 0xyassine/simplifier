import binascii
import sys
import re

#open encrypted file
with open('encrypted.txt') as f:
    content = f.read()
    
try:
    with open('/usr/share/wordlists/rockyou.txt', 'r') as infile:
        #wordSet = infile.readline()
        for password in infile:                   
            password = password.strip()           # read the word from wordlist

	    #insert code here 
	    	
            #x = re.search("regex-here",output)   #search in the output variable
            #if x:
            #	r = open("result.txt","a+")       #write to file if found
            #	r.write(myline)
            #	r.close()       
except IOError:
       print 'error opening file'
