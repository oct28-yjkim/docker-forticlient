FROM ubuntu:18.04

ENV VPNADDR \
    VPNUSER \
    VPNPASS

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
  ca-certificates \
  expect \
  net-tools \
  iproute2 \
  ipppd \
  iptables \
  wget \
  && apt-get clean -q && apt-get autoremove --purge \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Install fortivpn client unofficial .deb
RUN wget -O - https://repo.fortinet.com/repo/ubuntu/DEB-GPG-KEY | sudo apt-key add - 
RUN deb [arch=amd64] https://repo.fortinet.com/repo/ubuntu/ /bionic multiverse 

# Run setup
RUN apt-get update 
RUN apt install forticlient

# Copy runfiles
COPY forticlient /usr/bin/forticlient
COPY start.sh /start.sh

CMD [ "/start.sh" ]
