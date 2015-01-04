FROM centos:centos7
MAINTAINER Marcos Hernandez "marcos.hernandez@gmail.com"
ENV REFRESHED_AT 2015-01-04
RUN yum -y update
RUN yum install -y tar java
RUN yum clean all
ADD http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz /opt/dynamodb/
WORKDIR /opt/dynamodb
RUN tar -xzf dynamodb_local_latest.tar.gz
RUN rm dynamodb_local_latest.tar.gz
VOLUME ["/opt/dynamodb/data"]
EXPOSE 8000
ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar"]
CMD ["-dbPath", "/opt/dynamodb/data"]
