FROM debian:buster-slim

MAINTAINER Jason Hill
LABEL org.opencontainers.image.authors="jason@hill.io"

EXPOSE 80 443 1180 11443


RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils \
  && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    dnsutils \
    iproute2 \
    jq \
    mtr \
    busybox \
    curl httpie wget \
    net-tools \
    nginx \
    openssl \
    libnet-telnet-perl \
    telnet \
    procps \
    tcpdump \
    tcptraceroute \
    nmap \
    wireshark

COPY docker/index.html /usr/share/nginx/html/

COPY docker/nginx.conf /etc/nginx/nginx.conf

COPY docker/entrypoint.sh /entrypoint.sh


# Start nginx in foreground:
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
