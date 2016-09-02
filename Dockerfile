# Mininet

FROM ubuntu:16.04

MAINTAINER IWASE Yusuke <iwase.yusuke0@gmail.com>
ARG user=iwaseyusuke

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /root/

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
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /root/ENTRYPOINT.sh

ENTRYPOINT ["/root/ENTRYPOINT.sh"]
