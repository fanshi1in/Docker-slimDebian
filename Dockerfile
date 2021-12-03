FROM python:3.9.7-slim

LABEL maintainer="imfanshilin@gmail.com"

COPY install_opus_tools.sh /opt

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y locales pkg-config build-essential \
                          libx264-dev libx265-dev libpcap-dev \
                          libssl-dev wkhtmltopdf ttf-wqy-microhei \
                          curl libflac-dev mkvtoolnix \
    && apt-get purge -y opus* libopus-dev \
    && pip install pdfkit requests-html requests loguru yt-dlp wget uvloop \
    && pip install --pre yutto \
    && cd /opt \
    && bash install_opus_tools.sh \
    && apt-get remove -y pkg-config build-essential libpcap-dev libssl-dev \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && rm -rf /root/.pip \
    && rm -f /opt/install_opus_tools.sh

ENV LANG zh_CN.utf8
WORKDIR /opt
CMD ["/bin/bash"]
