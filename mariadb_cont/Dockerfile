FROM centos:7

MAINTAINER SharxDC

RUN yum -y install --setopt=tsflags=nodocs epel-release && \ 
    yum -y install --setopt=tsflags=nodocs mariadb-server pwgen psmisc hostname && \ 
    yum -y erase vim-minimal && \
    yum -y update && yum clean all

# Fix permissions to allow for running on openshift
#COPY fix-permissions.sh ./
#RUN ./fix-permissions.sh /var/lib/mysql/   && \
#    ./fix-permissions.sh /var/log/mariadb/ && \
#    ./fix-permissions.sh /var/run/

COPY entrypoint_v01.sh /entrypoint.sh
RUN /bin/chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Place VOLUME statement below all changes to /var/lib/mysql
#VOLUME /var/lib/mysql

# By default will run as random user on openshift and the mysql user (27)
# everywhere else
USER 27

EXPOSE 3306
CMD ["mysqld_safe"]
