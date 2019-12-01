FROM centos:7
MAINTAINER SharxDC

COPY *.repo /etc/yum.repos.d/
COPY stnebula.sh /usr/local/bin/
#COPY memcached /etc/sysconfig/

RUN /bin/chmod +x /usr/local/bin/stnebula.sh

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install --setopt=tsflags=nodocs opennebula-sunstone\
                                           redhat-lsb-core \
                                           opennebula-common \
                                           yum-utils \
                                           rubygem-rack \
                                           memcached && \
    yum-config-manager --disable epel && \
    yum -y install --setopt=tsflags=nodocs passenger \
                                           nginx && \
    yum -y update && yum clean all && \
    rm -f /etc/nginx/conf.d/nginx.conf && \
    rm -f /etc/nginx/nginx.conf &&\ 
#    rm -rf /etc/one/* && \
#    rm -rf /var/lib/one/*
    tar -cvzf /varlibone.tar.gz --remove-files /var/lib/one/* && \
    tar -cvzf /etcone.tar.gz --remove-files /etc/one/* 
    

RUN gem install --no-rdoc bundler --version '<2.0' && \
    /usr/share/one/install_gems --yes && \
#    rm -rf /etc/one/* && \
#    rm -rf /var/lib/one/*
    
COPY passenger.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/


#VOLUME /etc/one
#VOLUME /var/lib/one
EXPOSE 80, 29876 

#USER nginx
ENTRYPOINT /usr/local/bin/stnebula.sh
