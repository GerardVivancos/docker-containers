FROM centos:centos6
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2014-12-04
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install nginx
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx"]
