# docker-wireguard
Simple Container hosting a wireguard instance on top of Debian

## Usage

The container needs to be privileged (`--privileged`) or at least add capabilities to create interfaces (`--cap-add`).

Basic usage: `docker run -e PEERKEY="<public key of endpoint>" docker-wireguard`
This is the most simple command to run the container. This will create a private key on the fly.

## Environment variables

| Name | Required | Default | Explanation | Example
| - | - | - | - | - |
| PRIVKEY | No | Generating a new private key | The private key for the container wireguard entpoint | `base64 gibberish` |
| PEERKEY | Yes | (none) | The public key of your endpoint | `base64 gibberish` |
| LPORT | No | 12345 | The port to listen for connections | 51423 |
| OWNIP | No | 192.168.0.1 | The IP address assigned for the container endpoint | 10.13.37.1 |
| BLOCKSIZE | No | 16 | The blocksize (netmask) of your local IP net | 8 (as in: 10.0.0.0/8) |
| PEERADDR | No | (none) | If set, tries to connect to the set server. Don't forget the port! | wg.maride.cc:51423 |
