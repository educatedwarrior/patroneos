#!/bin/bash

#Update patroneous config
sed -i -e "s/localhost:8080/${LOG_ENDPOINT}/g" ${CONFIGFILE}
sed -i -e "s/localhost:8081/${FILTER_ENDPOINT}/g" ${CONFIGFILE}
sed -i -e "s/localhost/${NODEOS_URL}/g" ${CONFIGFILE}

#Update haproxy.cfg
sed -i -e "s/localhost:8081/${FILTER_ENDPOINT}/g" /usr/local/etc/haproxy/haproxy.cfg

#Update ssl.pem
cat /opt/certs/fullchain.pem /opt/certs/privkey.pem > /usr/local/etc/haproxy/ssl.pem
#cp /opt/certs/ssl.pem /usr/local/etc/haproxy/

#Launch daemons
haproxy -f /usr/local/etc/haproxy/haproxy.cfg
fail2ban-client -b start
patroneosd -configFile /etc/patroneos/config.json -mode fail2ban-relay &

#Tail logs
tail -f /var/log/patroneosd.log /var/log/fail2ban.log
