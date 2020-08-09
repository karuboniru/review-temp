# The trojan container image

## Volume `/etc/trojan`
Should contain: 
 - A `config.json`, see [Trojan config guide](https://trojan-gfw.github.io/trojan/config)
 - Whatever file your `config.json` references

## Port Export
 - In fact, depends on what port you use in your `config.json`, I suggest to specify trojan to listen on port `1080`.

## Usage case
### Server mode
trojan folder:
 - `config.json`, with reference to `/etc/trojan/cert.pem` and `/etc/trojan/privkey.pem`
 - `cert.pem`
 - `privkey.pem`

run
```
# podman run -d \
    -v trojan:/etc/trojan:z \
    -p 443:1080 \  # of course you can use any-port:1080, if >1024, no root permission needed
    --name trojan-server-443 \
    trojan
```

### Client mode
trojan folder:
 - `config.json`

run
```
$ podman run -d \
    -v trojan:/etc/trojan:z \
    -p 1080:1080 \
    --name trojan-client-1080 \
    trojan
```