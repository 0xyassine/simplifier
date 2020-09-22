# simplifier

## What is simplifier

A simple python3 script to generate reverse shells based on [nishang](https://github.com/samratashok/nishang/tree/master/Shells) and [pentestmonkey](http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet) shells.<br/>
In addition , you can create undetectable payload to bypass AV (tested with bitdefender,windows defender and others)<br/>
This option will use the `tvasion` script created by loadenmb , you can check it [here](https://github.com/loadenmb/tvasion)<br/>
I just automated the `tvasion` script to make the work easier.<br/><br/>
With simplifier,you can setup Kali,Parrot and mx-linux (debian 10 buster) with the most used pentesting tools ! <br/>
The script will auto-check the sources list of kali and parrot (mx-linux comming soon :) ),add the required links then install top tools automatically for you .<br/><br/>
I added two custom scripts ,you can install them directly from the tool: <br/>
1- smb-login-bruteforce.sh: based on pure bash to avoid python errors ! <br/>
2- basic-web-enum.py      : ability to fetch the page source and give you detailed output about the page title,robots.txt,comments,technology used and more ...<br/><br/>
More scripts will be added soon <br/><br/>

## How to install
  
--> python3-pip ,powershell and metasploit framework are required.<br/>
--> Please install metasploit and configure it before running the script ... <br/>


1- git clone https://github.com/0xyassine/simplifier.git <br/>
2- cd simplifier <br/>
3- apt install mono-mcs -y <br/>
4- pip3 install -r requirements.txt <br/>
5- chmod +x simplifier.py <br/>
6- ./simplifier.py

> Note: to run it from any location: ln -s $(pwd)/simplifier.py /usr/local/bin/

![info](https://github.com/0xyassine/simplifier/blob/master/img/info.png)
