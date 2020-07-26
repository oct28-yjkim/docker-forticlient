FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
  openfortivpn \
  wget \
  && apt-get clean -q && apt-get autoremove --purge \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Install openfortivpn
RUN mknod /dev/ppp c 108 0
RUN wget -N --no-check-certificate https://github.com/nadoo/glider/releases/download/v0.10.0/glider_0.10.0_linux_amd64.tar.gz
RUN tar zxvf glider_0.10.0_linux_amd64.tar.gz && rm glider_0.10.0_linux_amd64.tar.gz
RUN chmod +x glider_0.10.0_linux_amd64/glider
RUN cp glider_0.10.0_linux_amd64/glider /usr/bin/glider
RUN mkdir /root/.glider



# Copy runfiles
COPY start.sh /start.sh
ENTRYPOINT [ "/start.sh" ]
CMD ["openfortivpn"]