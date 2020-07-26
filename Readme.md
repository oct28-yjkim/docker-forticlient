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
    ```

2. Run the following command to start the container.

### Linux
    ```
    $ docker container run \
        --cap-add=NET_ADMIN \
        --device=/dev/ppp \
        --rm \
        -v /path/to/config:/etc/openfortivpn/config:ro \
        vicnz03/forticlient
    ```

Now you can use SSL-VPN via `http://<container-ip>:8443` or `socks5://<container-ip>:8443`.

### OSX
    ```
    $ docker container run \
        --cap-add=NET_ADMIN \
        --privileged  \
        --rm \
        -p "8888:8888" \
        -v /path/to/config:/etc/openfortivpn/config:ro \
        vicnz03/forticlient
    ```
Now you can use SSL-VPN via `http://localhost:8888` or `socks5://localhost:8888`.