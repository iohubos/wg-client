FROM debian:11.2

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wireguard wget curl procps \
    iproute2 net-tools iptables iputils-ping \
    && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --set iptables /usr/sbin/iptables-legacy >/dev/null 2>&1

COPY start-wg.sh /start-wg.sh

ENTRYPOINT ["/start-wg.sh"]