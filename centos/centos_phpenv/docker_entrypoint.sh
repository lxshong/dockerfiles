#!/bin/sh
set -e

mkdir /var/lib/www \
&& chown -R www:www /var/lib/www 

supervisord -c /etc/supervisord.conf

exec "$@"