[**简体中文**](https://github.com/fanshi1in/bicodec/blob/main/README_zh.md)&nbsp;&nbsp;&nbsp;[**English**](https://github.com/fanshi1in/bicodec/blob/main/README.md)

## 定义

bicodec 是一个基于 ffmpeg with libopus 和 [opus-tools](https://opus-codec.org/release/dev/2018/09/18/opus-tools-0_2.html) 的 Docker 镜像.

## 简介

此镜像在 [marrold/marrold-docker-opus-toolsmarrold-docker-opus-tools](https://github.com/marrold/marrold-docker-opus-tools) 基础上加入 ffmpeg 第三方库(libopus)，<b>在此表示感谢！</b>

此镜像目前仅适用于`amd64`正常运行；

此镜像里的脚本文件基于 [nottt](https://gist.github.com/Nottt/f55dd79ca235d8add67423a76b304961)， 用于一键安装 ffmpeg with libopus 和 opus-tools；

此镜像里的 ffmpeg 版本号是 4.4，opus-tools 的版本号是 0.2。

## 使用方法说明

### 安装

`docker run -it --name ffmpeg-opus -v ~/media/:/media fanshilin/bicodec`

### 音轨转换举例

`docker exec -it ffmpeg-opus ffmpeg -i "/media/xxx.dts" -ac 6 -c:a libopus -b:a 768k "/media/xxx.opus"`

`docker exec -it ffmpeg-opus opusenc --bitrate 768 "/media/xxx.wav" "/media/xxx.opus"`

## 证书文件

This Dockerfile is licensed under the terms of the _MIT license_. For other dependencies such as opus and opus-tools, please see their relevant licenses.

