FROM ubuntu:latest
MAINTAINER Markus Rainer <markus.rainer@nts.eu>

COPY ./init.sh /opt/init.sh

USER root
RUN mkdir /root/.ssh 
RUN apt-get update \
    && apt-get install -y \
    openssh-server \
    vpnc \
    net-tools \
    netcat \
    dnsutils \
    iputils-ping \
    vim \
    && apt-get clean \
    && apt-get autoremove
    && chmod +x /opt/init.sh
    
EXPOSE 22
VOLUME ["/etc/vpnc","/root/.ssh"]
WORKDIR /etc/vpnc

ENTRYPOINT [ "/opt/init.sh" ]
