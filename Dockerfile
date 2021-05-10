FROM debian:buster-slim

LABEL maintainer="imfanshilin@gmail.com"

COPY install-opus-tools.sh /opt

RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y tcpreplay libpcap-dev pkg-config libssl-dev build-essential && \
    cd /opt && \
    bash install-opus-tools.sh && \
    apt-get remove -y build-essential

WORKDIR /opt
CMD ["/bin/bash"]
