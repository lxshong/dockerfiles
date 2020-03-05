#!/bin/sh
set -e

mkdir /var/lib/www \
&& chown -R www:www /var/lib/www \
&& source /etc/profile

supervisord -c /etc/supervisord.conf

exec "$@"