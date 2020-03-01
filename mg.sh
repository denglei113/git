#!/bin/bash
yum  -y  install  gcc    pcre-devel   zlib-devel 
tar  -zxvf  nginx-1.12.2.tar.gz
cd nginx-1.12.2 
 ./configure
make;make install
echo "装php依赖包"
yum   -y     install  php-fpm 
 systemctl  start php-fpm  
echo "安装完成，修改nginx配置文件 vim   +65  /usr/local/nginx/conf/nginx.conf"
