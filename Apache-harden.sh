#!/bin/bash
# script to harden apache2
a2enmod headers
#Increase KeepAliveTimeout
sed -i 's/KeepAliveTimeout 5/KeepAliveTimeout 60/' /etc/apache2/apache2.conf


# Making Apache Server Secure
echo " Header set X-XSS-Protection "1; mode=block" " >> /etc/apache2/apache2.conf
echo "Header always set X-Content-Type-Options "nosniff" " >>/etc/apache2/apache2.conf
echo 'Header always set Strict-Transport-Security "max-age=63072000;includeSubDomains"' >>/etc/apache2/apache2.conf

# Stop Click JAcking
echo "Header always append X-Frame-Options SAMEORIGIN" >> /etc/apache2/apache2.conf
# Stop displaying Apache Version
echo "ServerSignature Off" >> /etc/apache2/apache2.conf

# Show servertoken as Apache
echo "ServerTokens Prod" >> /etc/apache2/apache2.conf

#Disable Etag
echo "FileETag None" >>/etc/apache2/apache2.conf
#Disable Trace
echo " TraceEnable off" >>/etc/apache2/apache2.conf

#Enable Directory permissions
#echo -e "<Directory /var/www/html> \n Options  FollowSymLinks\n AllowOverride all \n Require all granted \n </Directory>"  >> /etc/apache2/sites-enabled/000-default.conf

echo " 			Restarting Apache "
echo -e "\n\n\n"

systemctl restart apache2
