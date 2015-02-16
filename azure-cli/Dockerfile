FROM gerardvivancos/nodejs:0.10.33
MAINTAINER Gerard Vivancos "gerard.vivancos@gmail.com"
ENV REFRESHED_AT 2015-02-16
RUN npm install -g azure-cli
RUN azure --completion >> ~/azure.completion.sh && \
	echo 'source ~/azure.completion.sh' >> ~/.bash_profile
ENTRYPOINT ["/bin/bash" , "--login"]
