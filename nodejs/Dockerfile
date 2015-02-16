FROM centos:centos7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-02-16
RUN yum install -y epel-release && \
	yum install -y nodejs npm && \
	yum update -y && \
	yum clean all
ENTRYPOINT ["/usr/bin/node"]
