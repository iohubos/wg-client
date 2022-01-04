#!/bin/bash
# Author: paolo.denti@gmail.com (Paolo Denti)

STATUS=stopped
if [[ -f /etc/wireguard/wg0.conf ]]; then
    wg-quick up /etc/wireguard/wg0.conf
    CHECKSUM="$(md5sum /etc/wireguard/wg0.conf)"
    STATUS=running
fi

while true; do
    if [[ -f /work/wg0.conf ]]; then
        NEW_CHECKSUM="$(md5sum /work/wg0.conf)"
        if [[ "$CHECKSUM" != "$NEW_CHECKSUM" ]]; then
            cp /work/wg0.conf /etc/wireguard/wg0.conf
            chmod 600 /etc/wireguard/wg0.conf
            
            if [[ "$STATUS" == "running" ]]; then
                echo "Reloading WireGuard"
                wg syncconf wg0 <(wg-quick strip wg0)
            else
                echo "Starting WireGuard"
                wg-quick up /etc/wireguard/wg0.conf
                STATUS=running
            fi

            CHECKSUM="$NEW_CHECKSUM"
        fi

        [[ -f /work/wg0.conf ]] && rm -f /work/wg0.conf
    fi

    sleep 1
done