[**简体中文**](https://github.com/fanshi1in/bicodec/blob/main/README_zh.md)&nbsp;&nbsp;&nbsp;[**English**](https://github.com/fanshi1in/bicodec/blob/main/README.md)

# bicodec

bicodec is a basic docker image containing wkhtmltopdf, python-pdfkit, ffmpeg with libopus and the [opus-tools](https://opus-codec.org/release/dev/2018/09/18/opus-tools-0_2.html).

## Info

This image is currently only available for the `amd64` architecture.

This script for installing ffmpeg with libopus and opus-tools.

The current ffmpeg version is 4.4 and opus-tools version is 0.2.

## Example Usage

`pdfkit.from_url('http://google.com', 'out.pdf') # external link`

`pdfkit.from_file('test.html', 'out.pdf') # local file`

`pdfkit.from_string('Hello!', 'out.pdf') # string`

`docker run -it --name ffmpeg-opus -v ~/media/:/media fanshilin/docker-ffmpeg-opus`

`docker exec -it ffmpeg-opus ffmpeg -i "/media/xxx.dts" -ac 6 -c:a libopus -b:a 768k "/media/xxx.opus"`

`docker exec -it ffmpeg-opus opusenc --bitrate 768 "/media/xxx.wav" "/media/xxx.opus"`

## License

This Dockerfile is licensed under the terms of the _MIT license_. For other dependencies such as opus and opus-tools, please see their relevant licenses.

