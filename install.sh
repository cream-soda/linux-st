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
sudo useradd -G adm,sudo -s /bin/bash -m -d /home/soda soda
sudo mkdir /home/soda/stat

apt-get install sysstat apache2 php7.0 libapache2-mod-php7.0 nginx



fi

