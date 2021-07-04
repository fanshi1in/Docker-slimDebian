FROM debian:buster-slim

LABEL maintainer="imfanshilin@gmail.com"

COPY upgrade_python.sh /opt
COPY install_opus_tools.sh /opt

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y locales && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
    apt-get install -y tcpreplay libpcap-dev pkg-config libssl-dev build-essential && \
    cd /opt && \
    bash upgrade_python.sh && \
    bash install_opus_tools.sh && \
    apt-get install -y python3-pip wkhtmltopdf ttf-wqy-microhei && \
    pip3 install pdfkit requests-html loguru wget bilili apscheduler uvloop && \
    pip3 install --pre yutto && \
    apt-get remove -y build-essential

ENV LANG zh_CN.utf8
WORKDIR /opt
CMD ["/bin/bash"]
