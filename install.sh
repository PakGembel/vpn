##upgrade
clear
echo V2Ray + SSH WebSocket
sleep 1
echo Check Access Rights...
sleep 0.5
apt-get update --allow-releaseinfo-change
clear
apt-get update
##apt-get upgrade -y

apt install nginx -y
apt install dropbear -y
cd /etc/default/d
wget -O /etc/default/dropbear https://raw.githubusercontent.com/PakGembel/vpn/main/dropbear
cd
cd /etc/nginx/
rm -r /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/PakGembel/vpn/main/nginx.conf
cd /etc/nginx/conf.d
wget -O /etc/nginx/conf.d/xray.conf https://raw.githubusercontent.com/PakGembel/vpn/main/default
wget -O /etc/nginx/conf.d/vps.conf https://raw.githubusercontent.com/PakGembel/vpn/main/vps.conf
# wget -O /etc/nginx/conf.d/xray.conf https://raw.githubusercontent.com/PakGembel/vpn/main/xray.conf

#cd /etc/nginx/sites-available/
#wget -O /etc/nginx/sites-available/default https://raw.githubusercontent.com/PakGembel/vpn/main/default
#apt install certbot python-certbot-nginx -y
#certbot --nginx

cd /etc/nginx/
wget -O /etc/nginx/fullchain.pem https://raw.githubusercontent.com/PakGembel/vpn/main/fullchain.pem
wget -O /etc/nginx/privkey.pem https://raw.githubusercontent.com/PakGembel/vpn/main/privkey.pem

cd
wget https://raw.githubusercontent.com/PakGembel/vpn/main/v2ray.sh
bash v2ray.sh
systemctl enable v2ray
systemctl start v2ray
cd
cd /usr/local/etc/v2ray/
wget -O /usr/local/etc/v2ray/config.json https://raw.githubusercontent.com/PakGembel/vpn/main/config.json

cd
cd /etc/systemd/system/
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/PakGembel/vpn/main/ws-openssh.service
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/PakGembel/vpn/main/ws-stunnel.service
cd
cd /usr/local/bin/
#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/PakGembel/vpn/main/ws-openssh.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/PakGembel/vpn/main/ws-stunnel
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-stunnel
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
systemctl enable ws-stunnel
systemctl start ws-stunnel
systemctl restart ws-stunnel

systemctl restart dropbear
systemctl restart v2ray
systemctl restart nginx
sudo ufw allow 'Nginx HTTP'

wget https://raw.githubusercontent.com/PakGembel/vpn/main/install-udpgw.sh
bash install-udpgw.sh
