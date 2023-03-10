# Docker AlpineLinux

```shell
docker run -it -p 8080:80 --name jdk8-alpine openjdk:8-jdk-alpine /bin/sh

$> apk update
$> apk add --no-cache nginx
$> mkdir /run/nginx
# 수정
$> vi /etc/nginx/nginx.conf

# nginx 기동
$> nginx -g "daemon off;"

```