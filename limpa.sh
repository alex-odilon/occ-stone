#!bin/bash

data=$(date +%Y%m%d-%HH%MM)

systemctl stop rsyslog

tar czvf /var/consul/data/messages.tar.gz /var/log/messages
echo > /var/log/messages
mv -fv /var/consul/data/messages* /var/log/messages-$data.tar.gz

tar czvf /var/consul/data/unused.log.tar.gz /var/log/unused.log
echo > /var/log/unused.log
mv -fv /var/consul/data/unused* /var/log/unused.log-$data.tar.gz

systemctl start rsyslog