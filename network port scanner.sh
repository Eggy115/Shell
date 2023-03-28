#!/bin/sh
# Network Port Scanner

# Define network range and ports to scan
NETWORK="192.168.1"
PORTS="80 443 8080"

# Loop through all IP addresses in network range
for i in {1..254}
do
    # Loop through all ports to scan
    for port in $PORTS
    do
        # Test port connectivity
        (echo >/dev/tcp/$NETWORK.$i/$port) >/dev/null 2>&1 && echo "$NETWORK.$i:$port is open"
    done
done
