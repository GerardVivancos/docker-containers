FROM centos:centos7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-01-04
RUN yum install -y bind && yum clean all
ADD named.conf /var/named/named.conf
ADD http://www.internic.net/domain/named.root /var/named/named.ca
RUN chmod -R 774 /var/named && chown -R root /var/named
VOLUME ["/var/named/"]
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["/usr/sbin/named", "-c", "/var/named/named.conf", "-g"]
