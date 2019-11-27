#!/bin/bash
#sudo chown -R root:9869 /etc/one
#sudo chown -R 9869:9869 /var/lib/one
#ls -la /etc/one/
#ls -la /var/lib/one
/usr/bin/memcached -u memcached -p 11211 -m 64 -c 1024 &
echo "memcached service is started"
#if [ -d /var/lib/one ]; then echo "vars exist"; else tar xvzpf /varlibone.tar.gz; fi
#if [ -d /etc/one ]; then echo "confs exist"; else tar xvzpf /etcone.tar.gz; fi
ping localhost -c 3 -i 2 2>&1 >/dev/null
echo "nginx is started, enjoy"
/usr/sbin/nginx
tail -f /var/log/nginx/*.log
