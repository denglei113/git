#!/bin/bash
yum -y  install php php-devel automake autoconf
 tar -zxf php-redis-2.2.4.tar.gz
cd phpredis-2.2.4/
phpize  
./configure  --with-php-config=/usr/bin/php-config
make;make install
