FROM centos:7
MAINTAINER 1770472946@163.com
ADD get-pip.py /root/get-pip.py
RUN yum -y install python3 \
	&& rm -rf /var/cache/dnf \
	&& python3 /root/get-pip.py \
	&& rm -rf /root/get-pip.py \
	&& pip install supervisor \
	&& echo_supervisord_conf > /etc/supervisord.conf \
	&& mkdir /etc/supervisord.d \
	&& sed -i "s/.*nodaemon.*/nodaemon=true/g" /etc/supervisord.conf \
	&& echo "[include]" >> /etc/supervisord.conf \
	&& echo "files = supervisord.d/*.ini" >> /etc/supervisord.conf 

CMD ["supervisord","-c","/etc/supervisord.conf"]
