#!/usr/bin/python3
#developed by YaSsInE
import requests
import re
from colorama import Fore,Style
from optparse import OptionParser
from mechanize import Browser
import sys
import signal
import httplib2
import urllib.request
from bs4 import BeautifulSoup, SoupStrainer, Comment
import pyfiglet
import subprocess
import builtwith
from OpenSSL.SSL import Connection, Context, SSLv3_METHOD, TLSv1_2_METHOD
from datetime import datetime, time
import socket
import ssl
#pip3 install builtwith
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

parser = OptionParser(description="Python script to automate basic web enumeration")

def signal_handler(sig, frame):
    print(Fore.GREEN+'\nThank you for using my tool !! See you soon ...')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

def options():
	parser.add_option('-u', '--url',dest="url",help="file to be analyzed")
	option, args = parser.parse_args()
	if not option.url:
		print("[-] Please use -h for help")
	return option

def request(url):
    try:
        return requests.get(url, verify=False)
    except requests.exceptions.ConnectionError:
        pass

def get_links(url):
    temp = []
    print(Fore.RED+"[+] Links in the page:"+Fore.GREEN)
    try:
        parser = 'html.parser'
        resp = urllib.request.urlopen(url)
        soup = BeautifulSoup(resp, parser, from_encoding=resp.info().get_param('charset'))
        for link in soup.find_all('a', href=True):
            if link['href'] != '#' and link['href'] != '':
                temp.append(link['href'])
        for i in list(dict.fromkeys(temp)):
            print(Fore.RED+"    --> "+Fore.GREEN+i)
        if(len(temp)) == 0:
            print(Fore.RED+"    --> "+Fore.GREEN+"No links found")
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass
def get_page_title(url):
    '''
    br = Browser()
    br.open(url)
    print(Fore.RED+"[+] Page title:")
    if br.title():
        print(Fore.RED+"    --> "+Fore.GREEN+br.title())
    '''
    print(Fore.RED+"[+] Page title:")
    try:
        html = requests.get(url).read().decode('utf8')
        soup = BeautifulSoup(html, 'html.parser')
        title = soup.find('title')
        if title == None:
            print(Fore.RED+"    --> "+Fore.GREEN+"No title found")
        else:
            print(Fore.RED+"    --> "+Fore.GREEN+str(title.text))
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass

def get_page_headers(response):
    print(Fore.RED+"[+] Page headers:"+Fore.GREEN)
    try:
        for i in response.headers.items():
            print(Fore.RED+"    --> "+Fore.GREEN+i[0]+Fore.RED+": "+Fore.GREEN+i[1])
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass

def scripts_links(url):
    temp =[]
    print(Fore.RED+"[+] Script links in the page:"+Fore.GREEN)
    try:
        parser = 'html.parser'
        resp = urllib.request.urlopen(url)
        soup = BeautifulSoup(resp, parser, from_encoding=resp.info().get_param('charset'))
        for link in soup.find_all('script', src=True):
            if link['src'] != '#' and link['src'] != '':
                temp.append(link['src'])
        for i in temp:
            print(Fore.RED+"    --> "+Fore.GREEN+i)
        if(len(temp)) == 0:
            print(Fore.RED+"    --> "+Fore.GREEN+"No script links found")                
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass

def comment(url):
    print(Fore.RED+"[+] Comments in the page:"+Fore.GREEN)
    try:
        parser = 'html.parser'
        resp = urllib.request.urlopen(url)
        soup = BeautifulSoup(resp, parser, from_encoding=resp.info().get_param('charset'))
        comments = soup.findAll(text = lambda text: isinstance(text, Comment))
        for link in comments:
            print(Fore.RED+"    --> "+Fore.GREEN+link.strip())
        if len(comments) == 0:
            print(Fore.RED+"    --> "+Fore.GREEN+"No comments found")
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass

def get_subdomain(response):
    output = ''
    print(Fore.RED+"[+] Subdomain from the source code:"+Fore.GREEN)
    try:
        html_page = response.content
        soup = BeautifulSoup(html_page, 'html.parser')
        text = soup.find_all(text=True)
        blacklist = ['script','js']
        for t in text:
            if t.parent.name not in blacklist:
                output += '{} '.format(t)
        x = re.findall(r"([a-z -]+)\.([a-z -]+)\.([a-z -]+)", str(output))
        if len(x) != 0:
            for i in range(len(x)):
                print(Fore.RED+'    --> '+Fore.GREEN+'.'.join(x[i]))
        else:
            print(Fore.RED+"    --> "+Fore.GREEN+"No subdomain found")
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass

def technology(url):
    key = []
    value = []
    print(Fore.RED+"[+] Technology used:"+Fore.GREEN)
    try:
        try:
            web  = builtwith.parse(url)
        except:
            print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
            pass
        for key,value in web.items():
            print(Fore.RED+"    --> "+Fore.GREEN+key+Fore.RED+": "+Fore.GREEN,",".join(value))
        if len(web.items()) == 0:
            print(Fore.RED+"    --> "+Fore.GREEN+"Not detected")
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass            

def parse_robots(url):
    print(Fore.RED+"[+] robots.txt file:"+Fore.GREEN)
    x = re.findall(r"([a-zA-Z]+\:\/\/+)([a-z-A-Z0-9\.\:%&]+)", str(url))
    if len(x) != 0:
        for i in range(len(x)):
            temp = ''.join(x[i])
    final = temp+"/robots.txt"
    try:
        res = requests.get(final)
        if res.status_code == 200:
            for i in res.text.splitlines():
                if i != '':
                    print(Fore.RED+"    --> "+Fore.GREEN+i)
        else:
            print(Fore.RED+"    --> "+Fore.GREEN+"Not found")
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass

def parse_sitemap(url):
    print(Fore.RED+"[+] sitemap.xml file:"+Fore.GREEN)
    x = re.findall(r"([a-zA-Z]+\:\/\/+)([a-z-A-Z0-9\.\:%&#]+)", str(url))
    if len(x) != 0:
        for i in range(len(x)):
            temp = ''.join(x[i])    
    final = temp+"/sitemap.xml"
    try:
        res = requests.get(final)
        if res.status_code == 200:
            for i in res.text.splitlines():
                if i != '':
                    print(Fore.RED+"    --> "+Fore.GREEN+i)
        else:
            print(Fore.RED+"    --> "+Fore.GREEN+"Not found")
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"An error occurred ! , Please check your url again")
        pass


def get_ssl(url):
    print(Fore.RED+"[+] ssl certificate:"+Fore.GREEN)
    first_try = re.findall(r":([0-9]+)", str(url))
    if len(first_try) != 0:
        for i in range(len(first_try)):
            port = ''.join(first_try[i])
    else:
        port = int('443')       
    second_try = re.findall(r"/([0-9a-zA-Z\.%&#]+)", str(url))
    if len(second_try) != 0:
        for i in range(len(second_try)):
            host = ''.join(second_try[i])         
    try:
        try:
            ssl_connection_setting = Context(SSLv3_METHOD)
        except ValueError:
            ssl_connection_setting = Context(TLSv1_2_METHOD)
        ssl_connection_setting.set_timeout(5)
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((host, int(port)))
            c = Connection(ssl_connection_setting, s)
            c.set_tlsext_host_name(str.encode(host))
            c.set_connect_state()
            c.do_handshake()
            cert = c.get_peer_certificate()
            print(Fore.RED+"    --> "+Fore.GREEN+"Is Expired: ", cert.has_expired())
            print(Fore.RED+"    --> "+Fore.GREEN+"Issuer: ", cert.get_issuer())
            subject_list = cert.get_subject().get_components()
            cert_byte_arr_decoded = {}
            for item in subject_list:
                cert_byte_arr_decoded.update({item[0].decode('utf-8'): item[1].decode('utf-8')})
            if len(cert_byte_arr_decoded) > 0:
                print(Fore.RED+"    --> "+Fore.GREEN+"Subject: ", cert_byte_arr_decoded)
            if cert_byte_arr_decoded["CN"]:
                print(Fore.RED+"    --> "+Fore.GREEN+"Common Name: ", cert_byte_arr_decoded["CN"])
            end_date = datetime.strptime(str(cert.get_notAfter().decode('utf-8')), "%Y%m%d%H%M%SZ")
            print(Fore.RED+"    --> "+Fore.GREEN+"Not After (UTC Time): ", end_date)
            diff = end_date - datetime.now()
            print(Fore.RED+"    --> "+Fore.GREEN+'Summary: "{}" SSL certificate expires on {} i.e. {} days.'.format(host, end_date, diff.days))
            c.shutdown()
            s.close()
    except:
        print(Fore.RED+"    --> "+Fore.GREEN+"Not found")
        pass 

ascii_banner = pyfiglet.figlet_format("WEB basics !")
print(Fore.RED+ascii_banner)
print("\n\t\t\t\t\t\t\tby YaSsInE\n")
print("\t"+Fore.GREEN+60*"=")
print(Fore.GREEN+"\t="+Fore.BLUE+"  Website    : https://0xyassine.github.io"+Fore.GREEN+"\t\t   =")
print(Fore.GREEN+"\t="+Fore.BLUE+"  HackTheBox : https://www.hackthebox.eu/profile/143843"+Fore.GREEN+"   =")
print(Fore.GREEN+"\t="+Fore.RED+"\t\t\t\t\t\t    v1.0"+Fore.GREEN+"   =")
print("\t"+Fore.GREEN+60*"="+"\n")

op = options()
if op.url:
    if op.url.startswith('http://') or op.url.startswith('https://'):
        print(Fore.RED+"[+] Trying to enumerate: "+Fore.GREEN+op.url)
        response = request(op.url)
        get_ssl(op.url)
        get_page_title(op.url)
        technology(op.url)
        parse_robots(op.url)
        parse_sitemap(op.url)
        get_links(op.url)
        get_page_headers(response)
        get_subdomain(response)
        comment(op.url)
        scripts_links(op.url)
    else:
        print(Fore.RED+"[-] Please use a valid URL format !")           
else:
    if op.url:
        print(Fore.RED+"[-] Please select a correct option value , use -h for help")
