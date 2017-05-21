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
echo "* * * * * root sudo tcpdump -G 20 -n dst port not 22 and src port not 22 -i any -q -W 1 -w /home/soda/stat/dump.cap" >> /etc/crontab
echo "* * * * * root /bin/sleep 20; sudo tcpdump -q -r /home/soda/stat/dump.cap > /home/soda/stat/dump.stat" >> /etc/crontab
echo "* * * * * root /bin/sleep 30; sudo tcpdump -G 20 -n dst port not 22 and src port not 22 -i any -q -W 1 -w /home/soda/stat/dump.cap" >> /etc/crontab
echo "* * * * * root /bin/sleep 50; sudo tcpdump -q -r /home/soda/stat/dump.cap > /home/soda/stat/dump.stat" >> /etc/crontab

mkdir /home/soda/rubbish

apt-get install -y sysstat apache2 php7.0 libapache2-mod-php7.0 bc
systemctl stop apache2
apt-get install -y nginx
systemctl stop nginx

cd /home/soda/rubbish
git clone https://github.com/cream-soda/linux-c.git
cd linux-c
cat default > /etc/nginx/sites-available/default
cat ports.conf > /etc/apache2/ports.conf
cat apache2.conf > /etc/apache2/apache2.conf

cd /home/soda/rubbish
git clone https://github.com/cream-soda/linux-st.git
cd linux-st
mv .htaccess /var/www/html/.htaccess
mv stat.sh /etc/init.d/stat.sh
mv systeminfo.php /var/www/html/systeminfo.php
mv table_cpu.sh /home/soda/table_cpu.sh
mv table_ios.sh /home/soda/table_ios.sh
mv table_lavg.sh /home/soda/table_lavg.sh
mv table_lsoc.sh /home/soda/table_lsoc.sh
mv table_mem.sh /home/soda/table_mem.sh
mv table_net.sh /home/soda/table_net.sh
mv table_scon.sh /home/soda/table_scon.sh
mv table_tt1.sh /home/soda/table_tt1.sh

a2enmod rewrite

systemctl start nginx
systemctl start apache2

###
cd /home/soda/rubbish
git clone https://github.com/cream-soda/inst.git
cd inst
mv stat_init.sh /etc/init.d/stat_init.sh
sudo rc-update add stat_init.sh defaults
###

/etc/init.d/stat.sh &


fi

