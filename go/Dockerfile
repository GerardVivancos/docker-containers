FROM debian:7.7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-02-03
WORKDIR /tmp
ENV VERSION 1.4.1
ENV OS linux
ENV ARCH amd64
ADD https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz /tmp/go$VERSION.$OS-$ARCH.tar.gz
RUN pwd
RUN ls
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
ENV path=$path:/usr/local/go/bin
ENTRYPOINT ["go"]
