#!/bin/bash
#sudo chown -R root:9869 /etc/one
#sudo chown -R 9869:9869 /var/lib/one
#ls -la /etc/one/
#ls -la /var/lib/one
#comment it in production?
#echo "Sonic2005" | /bin/passwd --stdin root
/usr/bin/ruby /usr/lib/one/oneflow/oneflow-server.rb & 
echo "oneflow service is started"
/usr/bin/ruby /usr/lib/one/onegate/onegate-server.rb
echo "onegate service is started"
tail -f /var/log/one/*
