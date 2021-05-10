
# Docker-ffmpeg-opus

Docker-ffmpeg-opus is a basic docker image containing ffmpeg with libopus and the [opus-tools](https://opus-codec.org/release/dev/2018/09/18/opus-tools-0_2.html).

## Info

This image is based on [marrold-docker-opus-tools](https://github.com/marrold/marrold-docker-opus-tools) <b>(Thanks!)</b>.

This image is currently only available for the `amd64` architecture.

This script for installing ffmpeg with libopus and opus-tools is based on [nottt](https://gist.github.com/Nottt/f55dd79ca235d8add67423a76b304961) .

The current ffmpeg version is 4.4 and opus-tools version is 0.2.

## Example Usage

`docker run -it --name ffmpeg-opus -v ~/media/:/media fanshilin/docker-ffmpeg-opus`

`docker exec -it ffmpeg-opus ffmpeg -i "/media/xxx.dts" -ac 6 -c:a libopus -b:a 768k "/media/xxx.opus"`

`docker exec -it ffmpeg-opus opusenc --bitrate 768 "/media/xxx.wav" "/media/xxx.opus"`

## License

This Dockerfile is licensed under the terms of the _MIT license_. For other dependencies such as opus and opus-tools, please see their relevant licenses.

