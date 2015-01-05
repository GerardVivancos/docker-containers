FROM gerardvivancos/ruby-2.2.0
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-01-05
RUN yum install -y epel-release 
RUN yum install -y nodejs && yum clean all && gem install jekyll --no-rdoc --no-ri
ENTRYPOINT ["jekyll"]
