#!/bin/bash
#sudo chown -R root:9869 /etc/one
#sudo chown -R 9869:9869 /var/lib/one
ls -la /etc/one/
ls -la /var/lib/one
#if mounted folders contain the configs from previous installations uncomment next lines, or nebula's gonna complain about the existing one_auth 
#cd /var/lib/one/.one && ls | grep -v one_auth | xargs rm -rfv
/usr/bin/oned 
echo "oned service is started"
ping localhost -c 3 -i 5 2>&1 >/dev/null
echo "mm_sched is started, enjoy"
/usr/bin/mm_sched
tail -f /var/log/one/one*
