FROM 17710472946/centos_nginx:v8
MAINTAINER 17710472946@163.com
ENV PHP_PATH=/usr/local/php
ADD php ${PHP_PATH}
RUN yum -y install epel-release \
	# 安装基础功能
	&& yum -y install libxml2-devel \
					libjpeg-devel \
					libpng-devel \
					freetype-devel \
					autoconf \
					bison \
					re2c \
					libmcrypt libmcrypt-devel \
					libmhash libmhash-devel \
	&& yum clean all \
	&& source /etc/profile \
	&& echo "export PATH=${PHP_PATH}/sbin:${PHP_PATH}/bin:$PATH" >> /etc/profile 
ADD php-fpm.ini /etc/supervisord.d/php-fpm.ini

