FROM debian:wheezy
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-07-01
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://http.debian.net/debian wheezy main\n\
    deb-src http://http.debian.net/debian wheezy main\n\
    deb http://http.debian.net/debian wheezy-updates main\n\
    deb-src http://http.debian.net/debian wheezy-updates main\n\
    deb http://security.debian.org wheezy/updates main\n\
    deb-src http://security.debian.org wheezy/updates main\n\
    " > /etc/apt/sources.list

RUN apt-get -y update && \
    apt-get -y --force-yes install dpkg-dev debhelper && \
    apt-get -y build-dep pure-ftpd && \
    mkdir /tmp/pure-ftpd
WORKDIR /tmp/pure-ftpd
RUN apt-get source pure-ftpd && \
    cd pure-ftpd* && \
    sed -i '/^optflags=/ s/$/ --without-capabilities/g' ./debian/rules && \
    dpkg-buildpackage -b -uc

RUN dpkg -i /tmp/pure-ftpd/pure-ftpd-common*.deb && \
    apt-get -y install openbsd-inetd && \
    dpkg -i /tmp/pure-ftpd/pure-ftpd_*.deb && \
    apt-mark hold pure-ftpd pure-ftpd-common

RUN groupadd ftpgroup && \
    useradd -g ftpgroup -d /dev/null -s /etc ftpuser

ADD purepw.txt ./
ADD pure-userinit.sh ./

RUN chmod +x pure-userinit.sh && ./pure-userinit.sh && pure-pw mkdb

ENTRYPOINT ["/usr/sbin/pure-ftpd", "-c", "30", "-C", "1", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-x", "-E", "-j", "-R"]

EXPOSE 21/tcp
