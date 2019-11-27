#!/bin/bash
#sudo chown -R root:9869 /etc/one
#sudo chown -R 9869:9869 /var/lib/one
ls -la /etc/one/
ls -la /var/lib/one
/usr/bin/oned 
echo "oned service is started"
ping localhost -c 3 -i 5 2>&1 >/dev/null
echo "mm_sched is started, enjoy"
/usr/bin/mm_sched
#/bin/bash
