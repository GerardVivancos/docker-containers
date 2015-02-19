FROM debian:7.7
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2014-12-26
WORKDIR /tmp
RUN apt-get update && \
	apt-get install -y wget ca-certificates make && \
	wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz && \
	apt-get clean && \
	tar -xzvf ruby-install-0.5.0.tar.gz && \
        cd ruby-install-0.5.0 && \
        make install && \
        ruby-install --system ruby 2.2.0 -- --disable-install-rdoc && \
	gem install bundler --no-ri --no-rdoc && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /usr/local/src/ruby*
WORKDIR /root
ENTRYPOINT ["/bin/bash"]
