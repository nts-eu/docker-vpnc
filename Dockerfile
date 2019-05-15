FROM ubuntu:latest
MAINTAINER Markus Rainer <markus.rainer@nts.eu>

COPY ./init.sh /opt/init.sh

USER root
RUN apt-get update \
    && apt-get install -y \
    openssh-server \
    vpnc \
    net-tools \
    netcat \
    dnsutils \
    iputils-ping \
    && apt-get clean \
    && apt-get autoremove
    
EXPOSE 22
VOLUME /etc/vpnc
WORKDIR /etc/vpnc

ENTRYPOINT [ "/opt/init.sh" ]
