#!/bin/bash
#keepalived master.config <<workstation password is modify>>
yum -y install keepalived
sed  -i 35,160d /etc/keepalived/keepalived.conf
sed  -i 31,32d  /etc/keepalived/keepalived.conf
sed  -i 12s/LVS_DEVEL/$HOSTNAME/   /etc/keepalived/keepalived.conf
sed  -i 12a'vrrp_iptables'  /etc/keepalived/keepalived.conf
sed  -i 13s/^/'   '/         /etc/keepalived/keepalived.conf
sed  -i 31s/192.168.200.16/192.168.4.80/  /etc/keepalived/keepalived.conf
sed  -i  21s/MASTER/BACKUP/  /etc/keepalived/keepalived.conf
sed  -i  24s/100/50/          /etc/keepalived/keepalived.conf
systemctl restart keepalived.service
systemctl enable keepalivied.service
exit

