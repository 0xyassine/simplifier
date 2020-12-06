#!/bin/bash
git clone https://github.com/Svenito/exploit-pattern.git /opt/exploit-pattern
cd /opt/exploit-pattern/
pip3 install -r /opt/exploit-pattern/requirements.txt
pip install -r /opt/exploit-pattern/requirements.txt
ln -s /opt/exploit-pattern/pattern.py /usr/local/bin/gen-pattern
chmod +x /usr/local/bin/gen-pattern

