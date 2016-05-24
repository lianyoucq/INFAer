#!/bin/bash

echo "Change the timezone to Asia/Shanghai and disable the UTC"
echo "Make sure the network is OK"
read -p "Go on? (y|n)" ANSWER
echo $ANSWER
ANSWER=$(echo $ANSWER | tr 'A-Z' 'a-z')
if [ $ANSWER = 'n' ]; then
        exit 1
fi

echo "###########BEGIN###########"
echo ZONE="Asia/Shanghai" > /etc/sysconfig/clock
### echo UTC=false >> /etc/sysconfig/clock 

rm /etc/localtime

ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

chkconfig ntpd on
chkconfig ntpdate on
service ntpd start
ntpq -pn
ntpstat
service ntpd restart
ntpstat

echo Done
echo "###########END#############"
