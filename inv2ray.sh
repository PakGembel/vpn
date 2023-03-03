##upgrade
clear
echo Installing Websocket-SSH Python
sleep 1
echo Check Access Rights...
sleep 0.5
apt-get update
apt-get upgrade -y

apt install nginx -y
cd
cd /etc/nginx/sites-available/
wget -O cd /etc/nginx/sites-available/default https://raw.githubusercontent.com/PakGembel/vpn/main/default
apt install certbot python-certbot-nginx -y
certbot --nginx

wget https://raw.githubusercontent.com/PakGembel/vpn/main/v2ray.sh
bash install-release.sh
systemctl enable v2ray
systemctl start v2ray
cd
cd /usr/local/etc/v2ray/
wget -O /usr/local/etc/v2ray/config.json https://github.com/PakGembel/vpn/blob/main/config.json

cd
cd /etc/systemd/system/
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/PakGembel/vpn/main/ws-openssh.service
cd
cd /usr/local/bin/
#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/PakGembel/vpn/main/ws-openssh.py
chmod +x /usr/local/bin/ws-openssh
##Screen
apt-get install screen -y
##python install
apt-get install python -y

cd
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

systemctl restart v2ray
systemctl restart nginx