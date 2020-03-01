#!/bin/bash
#keepalived master.config <<workstation password is modify>>
sed  -i 35,160d /etc/keepalived/keepalived.conf
sed  -i 31,32d  /etc/keepalived/keepalived.conf
sed  -i 12s/LVS_DEVEL/$HOSTNAME/   /etc/keepalived/keepalived.conf
sed  -i 12a'vrrp_iptables'  /etc/keepalived/keepalived.conf
sed  -i 13s/^/'   '/         /etc/keepalived/keepalived.conf
sed  -i 31s/192.168.200.16/192.168.4.80/  /etc/keepalived/keepalived.conf
###add LVS  virtual_server 192.168.4.80 80 {          //自动设置LVS规则（实验需要修改）
##  delay_loop 6
##  lb_algo  rr                              //设置LVS调度算法为RR //设置LVS的模式为DR（实验需要修改）
## # persistence_timeout 50               //（实验需要注释）
###注意这样的作用是保持连接，开启后，客户端在一定时间内始终访问相同服务器
##  protocol TCP
##  real_server 192.168.4.100 80 {        //设置后端web服务器的真实IP（实验需要修改）
##    weight 1                              //设置权重为1
##    TCP_CHECK {                         //对后台real_server做健康检查（实验需要修改）
##    connect_timeout 3
##    nb_get_retry 3
##    delay_before_retry 3
##    }
##  }
## real_server 192.168.4.200 80 {         //设置后端web服务器的真实IP（实验需要修改）
##    weight 2                              //设置权重为1
##    TCP_CHECK {                        //对后台real_server做健康检查（实验需要修改）
######3########################################3#################################3##################################3#########################################3#################################3#########################
#echo "virtual_server 192.168.4.80 80 {   
#  delay_loop 6
#  lb_algo  rr                         
#  lb_kind DR                         
# # persistence_timeout 50          
#  protocol TCP
#  real_server 192.168.4.100 80 {        
#    weight 1                    
#    TCP_CHECK {              
#    connect_timeout 3
#    nb_get_retry 3
#    delay_before_retry 3
#    }
#  }
# real_server 192.168.4.200 80 {       
#    weight 2                     
#    TCP_CHECK {      
#    connect_timeout 3
#    nb_get_retry 3
#    delay_before_retry 3
#    }
#  }
#"   >>   /etc/keepalived/keepalived.conf
systemctl restart keepalived.service
systemctl enable  keepalived.service
exit

