FROM centos:7
MAINTAINER SharxDC

COPY nebula.repo /etc/yum.repos.d/
COPY stnebula.sh /usr/local/bin/
RUN /bin/chmod +x /usr/local/bin/stnebula.sh

RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install --setopt=tsflags=nodocs opennebula-flow \
                                           opennebula-gate \
                                           opennebula-ruby \
                                           redhat-lsb-core && \
    yum -y update && yum clean all && \
    tar -cvzf /etcone.tar.gz --remove-files /etc/one/*

RUN gem install bundler --version '<2.0' && \
/usr/share/one/install_gems --yes

EXPOSE 2474, 5030

USER 9869
ENTRYPOINT /usr/local/bin/stnebula.sh
