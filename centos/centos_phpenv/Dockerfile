FROM 17710472946/centos_nginx_php:v4
MAINTAINER 17710472946@163.com
ADD docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh \
	&& yum -y install git \
	&& yum clean all \
	&& git --version \
	&& source /etc/profile \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& composer -v \
	&& composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
CMD ["/usr/local/bin/docker_entrypoint.sh"]