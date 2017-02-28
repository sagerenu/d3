if [ $UID -ne 0 ] ; then
echo " 403 Error !!.  Please run me as root"
exit
fi

#!/bin/bash
echo "#################################################################################################################"
echo "#                                                                                                               #"
echo "# 		Welcome!! This script will  install php-backend eviroment                                     #"
echo "#                                                       							      #"
echo "#################################################################################################################"
echo -e "\n\n\n"
echo " 				Updating System files... "
echo -e "\n\n\n"

apt-get update -y

echo -e "\n\n\n"
echo " 			Done Updating... "
echo -e "\n\n\n";
echo " 			Installing Apache... "

# Install apache2

apt-get install -y apache2
apt-get install libapache2-mod-php7.0 -y


echo -e "\n\n\n"
echo "			Apache Installed	"
echo -e "\n\n\n"
echo  "			Installing PHP 7..."
echo -e "\n\n\n"
#install php7

apt-get -y install php7.0*

echo -e "\n\n\n"
echo "			PHP 7 Installed.	"
echo -e "\n\n\n"
echo -e "\n\n\n"

echo "		Installing MySql Client...	"
echo -e "\n\n\n"
# install MySql


apt-get install -y mysql-client


echo -e "\n\n\n"
echo "		Mysql client installed"
echo -e "\n\n\n"
# Enable Various module's
echo "Enabling Various Modules"

a2enmod php7.0
a2enconf php7.0-fpm
a2enmod rewrite
a2enmod proxy_fcgi setenv

echo -e "\n\n\n"
echo "		Required Modules Enabled"
echo -e "\n\n\n"
echo " 			Restarting Apache "
echo -e "\n\n\n"

systemctl restart apache2

echo "			Apache Restarted"
echo -e " \n\n\n "

echo "Creating a New User...."

echo -e " \n\n\n "

echo " Please enter the name of user: "
# Take input from user

read usr_name

# Create a directory for user

mkdir -p /var/www/html/$usr_name

# Make a new user and  set his Password
useradd $usr_name -d /var/www/html/$usr_name -s /bin/bash

chown -R $usr_name:$usr_name /var/www/html/$usr_name

echo "$usr_name:$usr_name-123#@"|chpasswd


# Enable SSH login

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

echo "SSH via Password Authentication enabled"

echo "$usr_name  ALL=NOPASSWD:ALL #Sudo rights for $usr_name  " >>/etc/sudoers

echo "Sudo rights to $usr_name has been been provided with NOPASSWD Authentication"

echo -e "\n\n\n\n\n\n"

echo "Synchronizing System Time"

apt-get install -y ntp

echo "Enter Hostname. This will be used to identify different servers i.e Dev,Qa,Satging, Production--- "
read hname
hostnamectl set-hostname $hname
