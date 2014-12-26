FROM centos:centos7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2014-12-26
WORKDIR /root
ADD https://bootstrap.pypa.io/get-pip.py /root/
RUN python get-pip.py
RUN pip install awscli
ADD .aws /root/.aws/
ENTRYPOINT ["/bin/bash"]
