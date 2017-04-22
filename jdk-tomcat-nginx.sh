#!/bin/bash
if [ $UID -ne 0 ] ; then
echo " 403 Error !!.  Please run me as root"
exit
fi


echo "#################################################################################################################"
echo "#                                                                                                               #"
echo "# 		Welcome!! This script will install Java environment                                                 #"
echo "#                                                       							                                          #"
echo "#################################################################################################################"

# update system repos
apt-get update -y

#Install python software properties

apt-get install python-software-properties -y

# Add PPA java repository
add-apt-repository ppa:webupd8team/java
apt-get update

# install Java JRE and JDK from the PPA repository
apt-get install oracle-java8-installer -y
