#!/bin/sh
OS=`uname -m`;
wget -O /usr/bin/badvpn-udpgw1 "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw1 "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
fi
touch /etc/rc.local
echo "\nscreen -AmdS badvpn badvpn-udpgw1 --listen-addr 127.0.0.1:7100" >> /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw1
screen -AmdS badvpn badvpn-udpgw1 --listen-addr 127.0.0.1:7100


#!/bin/sh
OS=`uname -m`;
wget -O /usr/bin/badvpn-udpgw2 "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw2 "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
fi
touch /etc/rc.local
echo "\nscreen -AmdS badvpn badvpn-udpgw2 --listen-addr 127.0.0.1:7200" >> /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw2
screen -AmdS badvpn badvpn-udpgw2 --listen-addr 127.0.0.1:7200


#!/bin/sh
OS=`uname -m`;
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
fi
touch /etc/rc.local
echo "\nscreen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300" >> /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300
