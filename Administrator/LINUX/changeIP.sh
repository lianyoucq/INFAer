#!/bin/bash
HOSTNAME="$1"
IPADDR=$2
INTNAME=$3
SUBFIX=$(date +%s)

if [ $# -ne 3 ]; then
        echo "The parameter is not right"
	echo "Usage:"
        echo "$(basename $0) hostname ipaddress interfaceName"
        echo "e.g:  $(basename $0) ora119.sleety.com 192.168.146.119 eth0"
        exit 1
fi
echo "Hostname: $HOSTNAME"
echo "IP address: $IPADDR"
echo "Interface Name: $INTNAME"
read -p "Go on? (y|n)" ANSWER
echo $ANSWER
ANSWER=$(echo $ANSWER | tr 'A-Z' 'a-z')
if [ $ANSWER = 'n' ]; then
        exit 1
fi

##############################################################################
echo "Changing the hostname"
echo "###########BEGIN###########"
cp /etc/sysconfig/network /etc/sysconfig/network.${SUBFIX}
hostname ${HOSTNAME}
sed -i -e "/HOSTNAME/s/.*/HOSTNAME=${HOSTNAME}/" /etc/sysconfig/network
echo "###########END#############"

##############################################################################
### Transfer the $INTNAME to lowercase, for example, ETH0 -> eth0
INTNAME=$(echo $INTNAME | tr 'A-Z' 'a-z' )
INTNAME=/etc/sysconfig/network-scripts/ifcfg-${INTNAME}
echo "Changing the ${INTNAME}'s ip address "
echo "###########BEGIN###########"
cp ${INTNAME} ${INTNAME}.${SUBFIX}
sed -i -e '/BOOTPROTO/s/dhcp/static/'  -e '/IPV6/s/yes/no/' -e '/ONBOOT/s/no/yes/' ${INTNAME}
ifdown ${INTNAME}
ifup ${INTNAME}
echo "###########END#############"
echo 
echo 
##############################################################################
echo "Now the hostname is $(hostname)"
echo "Now the IP address is "
ifconfig ${INTNAME}
echo 
echo "Done"
