FROM debian:buster-slim

MAINTAINER Jason Hill
LABEL org.opencontainers.image.authors="jason@hill.io"

EXPOSE 80 443

ENV DEBIAN_FRONTEND noninteractive
RUN echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale \
  && apt-get update \
  && apt-get install -y locales apt-utils \
  && locale-gen --purge en_US.UTF-8 \
  && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && set -x \
  && addgroup --system --gid 101 nginx \
  && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx \
  && apt-get upgrade -y \
  && apt-get install -y \
    vim \
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
    tshark

COPY docker/index.html /usr/share/nginx/html/

COPY docker/nginx.conf /etc/nginx/nginx.conf

COPY docker/entrypoint.sh /entrypoint.sh


# Start nginx in foreground:
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
