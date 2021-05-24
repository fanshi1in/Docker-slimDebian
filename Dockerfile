FROM debian:buster-slim

LABEL maintainer="imfanshilin@gmail.com"

COPY install-opus-tools.sh /opt

RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y locales && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
    apt-get install -y tcpreplay libpcap-dev pkg-config libssl-dev build-essential && \
    cd /opt && \
    bash install-opus-tools.sh && \
    apt-get remove -y build-essential

ENV LANG zh_CN.utf8 
WORKDIR /opt
CMD ["/bin/bash"]
