# forticlient

Connect to a Fortigate VPNs through docker: openfortivpn + glider

## Usage

1. Create an openfortivpn configuration file.

    ```
    $ cat /path/to/config
    host = vpn.example.com
    port = 443
    username = foo
    password = bar
    trusted-cert = 123123
    ```
2. build image 
    
    ```
    $ docker build -t yjkim1ntels/forticlient:latest .
    ```

### Linux
    ```
    $ sudo docker container run \
        --cap-add=NET_ADMIN \
        --device=/dev/ppp \
        --net=host \
        --rm \
        -v /path/to/config:/etc/openfortivpn/config:ro \
        yjkim1ntels/forticlient:latest
    ```
