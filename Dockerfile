FROM busybox

ENV DOCKER_VERSION=1.11.2
ENV CA_CERTS_MD5=782dcde8f5d53b1b9e888fdf113c42b9

RUN mkdir -p /etc/ssl/certs
ADD https://curl.haxx.se/ca/cacert.pem /etc/ssl/certs/ca-certificates.crt
RUN echo "${CA_CERTS_MD5}  /etc/ssl/certs/ca-certificates.crt" | md5sum -c -

RUN \
    wget -P /tmp -O /usr/bin/docker-${DOCKER_VERSION} https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} && \
    ln -s /usr/bin/docker-${DOCKER_VERSION} /usr/bin/docker && chmod +x /usr/bin/docker /usr/bin/docker-${DOCKER_VERSION}

ADD . /src

WORKDIR /src

ENTRYPOINT ["/src/bin/dgc"]

# vim: set ft=dockerfile :
