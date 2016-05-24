#!/bin/bash

SUBFIX=$(date +%s)

echo "This script is used to disable the Desktop, Firewall, and Selinux"
echo 
read -p "Go on? (y|n)" ANSWER
echo $ANSWER
ANSWER=$(echo $ANSWER | tr 'A-Z' 'a-z')
if [ $ANSWER = 'n' ]; then
        exit 1
fi

#############################################################################
echo "Now disable the Desktop, it needs to restart mannually"
echo "###########BEGIN###########"
cp /etc/inittab /etc/inittab.${SUBFIX}
sed -i -e '/id:5:init/s/.*/id:3:initdefault:/'  /etc/inittab
echo "Done"
echo "###########END#############"

#############################################################################
echo "Now disable the Firwall"
echo "###########BEGIN###########"
service iptables stop
service ip6tables stop
chkconfig iptables off
chkconfig ip6tables off
echo "Done"
echo "###########END#############"

#############################################################################
echo "Now disable the SELINUX"
echo "###########BEGIN###########"
cp /etc/sysconfig/selinux /etc/sysconfig/selinux.${SUBFIX}
setenforce 0
sed -i -e '/SELINUX=enforcing/s/.*/SELINUX=disabled/' /etc/sysconfig/selinux 
echo "Done"
echo "###########END#############"
 
echo "Done"
