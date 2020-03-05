FROM 17710472946/centos_nginx:v8
MAINTAINER 17710472946@163.com
ENV PHP_PATH=/usr/local/php
ADD php ${PHP_PATH}
RUN echo "export PATH=${PHP_PATH}/sbin:${PHP_PATH}/bin:$PATH" >> /etc/profile 
ADD php-fpm.ini /etc/supervisord.d/php-fpm.ini

