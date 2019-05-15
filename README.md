# docker-vpnc
Docker with vpn client vpnc and ssh server

# docker run
docker run --name=vpnc_xxx --volume=/opt/docker/vpnc:/etc/vpnc:ro --volume=/home/my/.ssh:/root/.ssh:ro -itd -p 2222:22 --privileged ntsdev/vpnc
