FROM 17710472946/centos_supervisor:v7
MAINTAINER 17710472946@163.com
ENV RESOURCES=/usr/local/src \
	NGINX_PATH=/usr/local/nginx \
	WEB_PATH=/home/www/web \
	PCRE_VERSION=8.44 \
	OPENSSL_VERSION=1.0.2k \
	ZLIB_VERSION=1.2.11 \
	NGINX_VERSION=1.16.1

ADD pcre-${PCRE_VERSION}.tar.gz ${RESOURCES}
ADD nginx-${NGINX_VERSION}.tar.gz ${RESOURCES}
ADD openssl-${OPENSSL_VERSION}.tar.gz ${RESOURCES}
ADD zlib-${ZLIB_VERSION}.tar.gz ${RESOURCES}

RUN \
	# yum安装
	yum -y install gcc-c++ make perl perl-devel perl-ExtUtils-Embed\
	&& yum clean all \
	# 创建目录及www用户
	&& mkdir -p ${RESOURCES}\
	&& groupadd www \
	&& useradd -g www www \
	&& mkdir -p ${WEB_PATH}\
	&& chown www:www ${WEB_PATH} \

	&& cd ${RESOURCES}/nginx-${NGINX_VERSION} \
	# 编译安装
	&& ./configure --prefix=${NGINX_PATH} \
	--with-http_stub_status_module \
	--with-http_perl_module \
	--with-http_ssl_module \
	--with-openssl=${RESOURCES}/openssl-${OPENSSL_VERSION} \
	--with-zlib=${RESOURCES}/zlib-${ZLIB_VERSION} \
	--with-pcre=${RESOURCES}/pcre-${PCRE_VERSION} \
	&& make \
	&& make install \
	&& rm -rf /usr/local/src/* \
	&& cp -R ${NGINX_PATH}/html ${WEB_PATH} \
	&& chown -R www:www ${WEB_PATH}/html \
	&& echo "export PATH=${NGINX_PATH}/sbin:$PATH" >> /etc/profile
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
ADD nginx.ini /etc/supervisord.d/nginx.ini
EXPOSE 80

