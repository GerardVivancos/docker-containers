FROM centos:centos7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-02-16
RUN yum install -y epel-release && \
	yum install -y nodejs npm && \
	yum update -y && \
	yum clean all
RUN npm install -g azure-cli
RUN azure --completion >> ~/azure.completion.sh && \
	echo 'source ~/azure.completion.sh' >> ~/.bash_profile
ENTRYPOINT ["/bin/bash" , "--login"]
