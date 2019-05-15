FROM ubuntu:latest
MAINTAINER Markus Rainer <markus.rainer@nts.eu>


USER root
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y \
    openssh_server \
    vpnc \
    net-tools \
    netcat \
    dnsutils \
    && apt-get clean \
    && apt-get autoremove
    
EXPOSE 22
VOLUME /etc/vpnc/default.conf
WORKERDIR /etc/vpnc

CMD [ "vpnc" ]
