#!/bin/bash
#
# Debian
#

set -v
apt-get -y update
apt-get install -y ntpdate
apt-get install -y squid3 apache2-utils

cp /etc/squid3/squid.conf /etc/squid3/squid.conf.bak

cat << EOF > /etc/squid3/squid.conf
http_port 1335
http_port 1336
http_port 1337
http_port 1338
http_port 1339
http_access allow all
cache deny all
forwarded_for delete
request_header_access Via deny all
EOF

/etc/init.d/squid3 restart

echo "IP ADDRESS"

curl ifconfig.co