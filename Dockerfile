FROM ubuntu:latest
MAINTAINER Markus Rainer <markus.rainer@nts.eu>


USER root
RUN apt-get update \
    && apt-get install -y \
    openssh-server \
    vpnc \
    net-tools \
    netcat \
    dnsutils \
    && apt-get clean \
    && apt-get autoremove
    
EXPOSE 22
VOLUME /etc/vpnc
WORKDIR /etc/vpnc

CMD [ "vpnc" ]
