FROM centos:centos7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2014-12-26
WORKDIR /root
RUN yum install -y tar gcc openssl-devel libyaml-devel readline-devel zlib-devel make libffi-devel && yum clean all
ADD http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz /root/
RUN tar -xzf ruby-2.2.0.tar.gz
WORKDIR ruby-2.2.0
RUN ./configure --disable-install-doc --enable-shared && make && make install && make clean
WORKDIR /root
RUN rm -rf ruby-2.2.0
ENTRYPOINT ["/bin/bash"]
