# Wireguard docker client image for IOhubOS

[![License](https://img.shields.io/github/license/iohubos/wg-client.svg)](LICENSE)
[![CircleCI Build Status](https://circleci.com/gh/iohubos/wg-client/tree/main.svg?style=shield)](https://circleci.com/gh/iohubos/wg-client/tree/master)

## Startup

The local folder mounted on `/work` is watched for updates on the file `wg0.conf`; when created/modified, the WireGuard interface will be started/reconfigured on `wg0.conf` and `wg0.conf` is removed from the mapped folder.

```bash
docker run --rm -it --name wg-client \
    -v /tmp/wireguard:/work \
    --privileged \
    iohubos/wg-client
```
