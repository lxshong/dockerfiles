FROM 17710472946/centos_nginx:v7
MAINTAINER 17710472946@163.com
ENV RESOURCES=/usr/local/src \
	PHP_PATH=/usr/local/php \
	OPENSSL_PATH=/usr/local/openssl \
	CURL_PATH=/usr/local/curl \
	MCRYPT_PATH=/usr/local/mcrypt \
	PHP_VERSION=7.1.19 

ADD php-${PHP_VERSION}.tar.gz ${RESOURCES}
ADD openssl ${OPENSSL_PATH}
ADD curl ${CURL_PATH}
ADD mcrypt ${OPENSSL_PATH}

RUN \
	yum -y install epel-release \
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
	# 安装openssl
	# && cd ${RESOURCES}/openssl-${OPENSSL_VERSION} \
	# && ./config --prefix=${OPENSSL_PATH} \
	# && make \
	# && make install \
	# 下载php源码
	&& cd ${RESOURCES}/php-${PHP_VERSION} \
	&& ./configure --prefix=${PHP_PATH} --enable-fpm \
		--enable-pcntl \
		--with-pdo-mysql=mysqlnd \
		--with-openssl=${OPENSSL_PATH} \
		--with-mcrypt=${MCRYPT_PATH} \
		--with-curl=${CURL_PATH} \
		--with-zlib \
		--enable-mbstring=all \
		--with-freetype-dir=/usr \
		-with-png-dir=/usr \
		--with-jpeg-dir=/usr \
		--enable-exif \
		--enable-gd-native-ttf \
		--with-gd \
		--with-fpm-group=www \
		--with-fpm-user=www \
		--enable-bcmath \
		--enable-zip \
		--enable-sockets \
	&& make \
	&& make install \
	# 配置
	&& cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf \
	&& cp ${RESOURCES}/php-${PHP_VERSION}/php.ini-production /usr/local/php/lib/php.ini \
	&& echo "export PATH=${PHP_PATH}/sbin:${PHP_PATH}/bin:$PATH" >> /etc/profile \
	&& sed -i 's/.*daemonize.*/daemonize = no/g' /usr/local/php/etc/php-fpm.conf \
	&& cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf \
	&& rm -rf /usr/local/src/*
ADD php-fpm.ini /etc/supervisord.d/php-fpm.ini

