#!/bin/sh
# Author: 0xmarq
# Script: Apply system proxy settings (non-root)


if [ "$EUID" -eq 0 ]; then
    echo " Warning: Do not run this script as root."
    exit 1
fi


PROXY1="172.31.2.3:8080"
PROXY2="172.31.2.4:8080"


read -p "Select 1--> X.3 || 2--> X.4 (default=1): " choice

case "$choice" in
    1|"") PROXY="$PROXY1" ;;
    2)    PROXY="$PROXY2" ;;
    *)    echo " Invalid choice. Exiting..."; exit 1 ;;
esac


export http_proxy="http://$PROXY"
export https_proxy="http://$PROXY"
export no_proxy="localhost,127.0.0.1"

echo "Proxy settings applied for this session:"

