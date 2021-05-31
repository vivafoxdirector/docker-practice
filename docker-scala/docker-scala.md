# DockerFile 사용법
- [] 해당 DockerFile은 작성중이다. 우선은 참조사이트에 있는것을 이용하도록 한다.

## 설치 (작성중이니 아래의 참조사이트 방법을 우선 사용한다.)
1. 설치
```s
# 1. DockerFile 실행해서 이미지 생성
# $> docker build -t [컨테이너명] .
$> docker build -t java-scala .

# 2. 이미지를 이용하여 컨테이너 기동
$> docker run -ti --name java-scala java-scala /bin/bash
```
2. Ammonite설치
```s
$> sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/com-lihaoyi/Ammonite/releases/download/2.3.8/2.13-2.3.8) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && amm
```

# Scala 참조사이트 이용

## 설치
참조사이트 대로 한다.
1. 이미지 가져오기 및 컨테이너 기동
```s
$> docker pull hseeberger/scala-sbt:8u222_1.3.5_2.13.1

#$> docker run -it --rm hseeberger/scala-sbt:8u222_1.3.5_2.13.1
$> docker run -ti --name java-scala hseeberger/scala-sbt:8u222_1.3.5_2.13.1 /bin/bash
```
2. Ammonite설치
```s
$> sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/com-lihaoyi/Ammonite/releases/download/2.3.8/2.13-2.3.8) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && amm
```
3. OhMyZsh 설치
```s
$> apt-get install zsh
$> sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
# 참조사이트
- [hseeberger/scala-sbt](https://hub.docker.com/r/hseeberger/scala-sbt/)