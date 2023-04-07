# 설치
```s

# image create
docker build -t ubuntu:18 .

# container create
docker run -ti --name tta-ubuntu ubuntu:18 /bin/bash

## Java in Container
$> apt-get update
$> apt install openjdk-8-jdk
$> java -version

## Tip in Container
docker exec -ti <ContainerID> /bin/bash

## TTA Module Copy
docker cp iperf3_3.1.3-1_amd64.deb e535c52e635d:/root/iperf3_3.1.3-1_amd64.deb
docker cp iperf3_3.1.3-1_amd64.deb e535c52e635d:/root/iperf3_3.1.3-1_amd64.deb

## TTA Segging
$> dpkg -i libiperf0_3.1.3-1_amd64.deb
$> dpkg -i iperf3_3.1.3-1_amd64.deb
```