#!/bin/bash
yum -y install gcc
tar -xf redis-4.0.8.tar.gz
cd redis-4.0.8/
 make ; make install
 cd utils/
echo "装redis默认配置文件，连续敲回车即可"
 ./install_server.sh
echo "查看服务状态"
 /etc/init.d/redis_6379 status
 netstat -antupl |grep :6379

