#!/bin/bash
echo "please enter the name of pem file along with complete path"
read pathpem
echo "Enter the Ip address of server "
read ip1
echo "Path to certificate files"
read pathcert
cd $pathcert
scp -i $pathpem *.crt *.key ubuntu@$ip1:
ssh -i $pathpem  ubuntu@$ip1 -o "StrictHostKeyChecking no" -t "sudo -i"
s
