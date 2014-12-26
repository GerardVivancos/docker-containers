FROM centos:centos7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2014-12-25
WORKDIR /root
RUN yum install -y wget tar unzip
RUN wget -O - https://s3.amazonaws.com/ecs-preview-docs/amazon-ecs-cli-preview.tar.gz | tar -xz && unzip amazon-ecs-cli-preview/ecs-cli.zip && rm -rf amazon-ecs-cli-preview && python awscli-bundle/install && rm -rf awscli-bundle
ADD .aws /root/.aws/
ENV PATH /root/.local/lib/aws/bin:$PATH
ENTRYPOINT ["/bin/bash"]
