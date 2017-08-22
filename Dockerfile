FROM debian:latest

# Copy-Pasta from https://www.wireguard.com/install/
RUN echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
RUN printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' > /etc/apt/preferences.d/limit-unstable
RUN apt update
RUN apt-get install -y wireguard-dkms wireguard-tools

COPY run.sh /run.sh

ENV PRIVKEY=
ENV PEERKEY=
ENV LPORT=12345

CMD /run.sh
