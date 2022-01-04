FROM alpine:3.15.0

RUN apk add --no-cache iptables wireguard-tools-wg

COPY start-wg.sh /start-wg.sh

ENTRYPOINT ["/start-wg.sh"]