FROM alpine
RUN apk add --no-cache bash && \
    apk add --no-cache openssh-client && \
	apk add --no-cache docker-cli && \
    mv /bin/bash /bin/shell

COPY ssh-to-docker-host.sh /bin/bash
RUN mkdir /root/.ssh && \
	chmod u+x /bin/bash
ENTRYPOINT ["tail","-f","/dev/null"]
