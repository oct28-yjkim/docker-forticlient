#!/bin/bash
/usr/bin/glider -listen :8888 &
echo "http/socks5 proxy server: $(hostname -i):8888"
exec "$@"