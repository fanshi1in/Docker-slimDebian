FROM python:3.9.7-slim

LABEL maintainer="imfanshilin@gmail.com"

COPY opustools_install.sh /opt

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y pkg-config build-essential curl locales \
                        libx264-dev libx265-dev libpcap-dev \
                        libssl-dev wkhtmltopdf ttf-wqy-microhei \
                        libflac-dev mkvtoolnix \
    && apt-get purge -y opus* libopus-dev \
    && pip install pdfkit requests-html requests loguru yt-dlp uvloop \
    && pip install --pre yutto \
    && cd /opt \
    && bash opustools_install.sh \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && apt autoremove -y pkg-config build-essential locales libpcap-dev libssl-dev \
    && rm -f opustools_install.sh

ENV LANG zh_CN.utf8
WORKDIR /opt
CMD ["/bin/bash"]
