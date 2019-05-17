FROM ubuntu:latest
MAINTAINER Markus Rainer <markus.rainer@nts.eu>

COPY ./init.sh /opt/init.sh

USER root
RUN mkdir /root/.ssh 
RUN chmod +x /opt/init.sh
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

ENV GATEWAY 127.0.0.1
ENV IPSEC_ID group
ENV IPSEC_SECRET preshared
ENV IKE_METHODE psk
ENV XAUTH_USER user
ENV XAUTH_PW password

EXPOSE 22
VOLUME ["/root/.ssh"]
WORKDIR /etc/vpnc

ENTRYPOINT [ "/opt/init.sh" ]
