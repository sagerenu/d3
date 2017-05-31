#!/bin/bash
if [ $UID -ne 0 ] ; then
echo " 403 Error !!.  Please run me as root"
exit
fi

echo "Creating a New User...."

echo -e " \n\n\n "

echo " Please enter the name of user: "
# Take input from user

read usr_name


# Make a new user and  set his Password
useradd $usr_name -d /var/www/html/ -s /bin/bash

chown -R $usr_name:$usr_name /var/www/html/

echo "$usr_name:$usr_name-123#@"|chpasswd


# Enable SSH login

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

service ssh restart

echo -e "\n\n\n\n\n\n"
echo -e "\n\n\n\n\n\n"
echo "SSH via Password Authentication enabled"

echo "$usr_name  ALL=NOPASSWD:ALL #Sudo rights for $usr_name  " >>/etc/sudoers

echo "Sudo rights to $usr_name has been been provided with NOPASSWD Authentication"

echo -e "\n\n\n\n\n\n"

echo "Synchronizing System Time"

apt-get install -y ntp
echo -e "\n\n\n\n\n\n"
echo -e "\n\n\n\n\n\n"



#install postfix



DEBIAN_FRONTEND=noninteractive  apt-get install -y postfix
