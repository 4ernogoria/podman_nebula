FROM centos:7
MAINTAINER SharxDC

COPY nebula.repo /etc/yum.repos.d/
COPY stnebula.sh /usr/local/bin/ 
RUN /bin/chmod +x /usr/local/bin/stnebula.sh

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install --setopt=tsflags=nodocs opennebula-server \
                                           opennebula-ruby \
                                           redhat-lsb-core \
                                           opennebula-node-kvm \
                                           opennebula-common && \
    yum -y update && yum clean all

RUN gem install bundler --version '<2.0' && \
/usr/share/one/install_gems --yes

#VOLUME /etc/one/
#VOLUME /var/lib/one
EXPOSE 2633

USER 9869
ENTRYPOINT /usr/local/bin/stnebula.sh
