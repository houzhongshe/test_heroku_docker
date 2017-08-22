#!/bin/bash

if [ "$PRIVKEY" == "" ]; then
	PRIVKEY=$(wg genkey)
	echo "ENV PRIVKEY not set; setting to $PRIVKEY"
fi

echo "Your PUBKEY is $(echo $PRIVKEY | wg pubkey)"

if [ "$PEERKEY" == "" ]; then
	echo "ENV PEERKEY not set; giving up."
	exit
fi

echo "Adding interface 'wg0'"
ip link add dev wg0 type wireguard

echo "Adding IP range for 'wg0'"
ip addr add dev wg0 192.168.0.1/16

echo "Setting up wireguard-specific options"
echo "$PRIVKEY" > /tmp/privkey
wg set wg0 private-key /tmp/privkey listen-port 12345 peer $PEERKEY allowed-ips 192.168.0.0/16

echo "Setting interface 'wg0' up"
ip link set up wg0

echo "Entering eternal loop, goodbye ,o/"

while sleep 1; do
	wg show
done
