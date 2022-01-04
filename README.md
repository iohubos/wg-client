# Wireguard docker client image for IOhubOS

## Startup

The `/work` folder is watched for updates on the file `wg0.conf`; when created/modified, the WireGuard interface will be started/reconfigured on `wg0.conf` and `wg0.conf` is removed from the mapped folder.

```bash
docker run --rm -it --name wg-client -v /tmp/wireguard:/work --cap-add=NET_ADMIN --cap-add=SYS_MODULE iohubos/wg-client
```
