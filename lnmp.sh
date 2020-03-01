#!/bin/bash
yum -y install  gcc openssl-devel pcre-devel mariadb mariadb-server mariadb-devel php php-fpm php-mysql 
tar -xf nginx-1.12.2.tar.gz ;cd /root/nginx-1.12.2; ./configure --with-http_ssl_module --with-http_stub_status_module 
make; make install 
sed -i 65,71s/#//   /usr/local/nginx/conf/nginx.conf 
sed -i 70s/fastcgi_params/fastcgi.conf/ /usr/local/nginx/conf/nginx.conf
sed -i 69d /usr/local/nginx/conf/nginx.conf
systemctl restart php-fpm;systemctl restart mariadb;/usr/local/nginx/sbin/nginx 
systemctl enable  php-fpm;systemctl enable mariadb
#nginx.conf   add index.php
mysql -e 'create database wordpress character set utf8mb4'
mysql -e 'grant all on wordpress.* to  wordpress@localhost identified by "wordpress" '
mysql -e 'flush privileges'
unzip wordpress.zip
cd  wordpress
#cp -r  wordpress/* /usr/local/nginx/html/
#chown -R apache.apache /usr/local/nginx/html/




