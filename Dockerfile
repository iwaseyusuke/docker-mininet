# Mininet

FROM ubuntu:16.04

MAINTAINER IWASE Yusuke <iwase.yusuke0@gmail.com>
ARG user=iwaseyusuke

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
 && rm -rf /var/lib/apt/lists/* \
 && mv /bin/ping /sbin/ping \
 && mv /bin/ping6 /sbin/ping6 \
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump \
 && chmod +x /ENTRYPOINT.sh

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
