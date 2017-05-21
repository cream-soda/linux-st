#!/bin/bash

wai=$(whoami)

if [ "$wai" != "root" ]
then
 echo "You are not root"
 echo "Try to solve this problem"
 echo ""
 sudo ./install.sh
else
 echo "You are root"

echo "Let's install some programs"
useradd -G adm,sudo -s /bin/bash -m -d /home/soda soda
mkdir /home/soda/stat
echo "* * * * * root sudo tcpdump -G 25 -n dst port not 22 and src port not 22 -i any -W 1 -w /home/soda/stat/dump.cap" >> /etc/crontab
echo "* * * * * root /bin/sleep 29; sudo tcpdump -r /home/soda/stat/dump.cap > /home/soda/stat/dump.stat" >> /etc/crontab
echo "* * * * * root /bin/sleep 31; sudo tcpdump -G 25 -n dst port not 22 and src port not 22 -i any -W 1 -w /home/soda/stat/dump.cap" >> /etc/crontab
echo "* * * * * root /bin/sleep 57; sudo tcpdump -r /home/soda/stat/dump.cap > /home/soda/stat/dump.stat" >> /etc/crontab

apt-get install -y sysstat apache2 php7.0 libapache2-mod-php7.0
systemctl stop apache2
apt-get install -y nginx

sed 's/root \/var\/www\/html;/#root \/var\/www\/html.nginx;/g' /etc/nginx/sites-available/default > /home/soda/buff
cat /home/soda/buff > /etc/nginx/sites-available/default
sed 's/try_files $uri $uri\/ =404;/#/g' /etc/nginx/sites-available/default > /home/soda/buff
cat /home/soda/buff > /etc/nginx/sites-available/default
sed 's/location \/ {/{/g' /etc/nginx/sites-available/default > /home/soda/buff
cat /home/soda/buff > /etc/nginx/sites-available/default


fi

