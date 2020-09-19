# simplifier

## how to install

A simple python3 script to generate reverse shells based on [nishang](https://github.com/samratashok/nishang/tree/master/Shells) and [pentestmonkey](http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet) shells.<br/>
Added option to create undetectable payload (option 4 in the script)<br/>
This option will use the `tvasion` script created by loadenmb , you can check it [here](https://github.com/loadenmb/tvasion)<br/>
I just automated the `tvasion` script to make the work easier.<br/><br/>
--> python3-pip ,powershell and metasploit framework are required.<br/>
--> Please install metasploit and configure it before running the script ... <br/>


1- git clone https://github.com/0xyassine/simplifier.git <br/>
2- cd simplifier <br/>
3- apt install mono-mcs -y <br/>
4- pip3 install -r requirements.txt <br/>
5- chmod +x simplifier.py <br/>
6- ./simplifier.py

> Note: to run it from any location: ln -s $(pwd)/simplifier.py /usr/local/bin/

![info](https://github.com/0xyassine/simplifier/blob/master/img/info.jpg)
