# Docker-practice

### Command
* Docker Container 실행
```
> docker run [OPTION] [--name {CONTAINER_NAME}] {IMAGE_NAME} [PARAMETER]
> docker run -it --name ubuntu_container ubuntu /bin/bash
```

* 기동중인 Docker Container 에 접속
```
> docker exec -i -t [CONTAINER_ID(NAME)] /bin/bash
> docker exec -it [CONTAINER_ID(NAME)] /bin/bash
```
-i: STDOUT 상태로 할경우 사용한다.
-t: tty사용으로 컬러 콘솔을 사용한다.

* 기동중인 Docker Container 끝내지 않고 나오기
```
> docker exec -it [CONTAINER_ID(NAME)] /bin/bash
Ctrl+p+q
```
* Docker Hub 로그인
```
> docker login
> docker login --username=[USER_NAME] --email=[EMAIL@EMAIN.com]
```
* Docker Hub 레포지토리에 올리기
```
> docker push
> docker push admin/echo
```
* Docker Hub 레포지토리에 가져오기
```
> docker pull [TAG_NAME]
> docker pull foxdirector/httpd
```
* Imgae에 TAG 부여
```
> docker tag [IMAGE_ID] [DockerHubAccountName/IMAGE_NAME:버전라벨]
> docker tag 4a6760db613f admin/echo:latest
```
* Image에서 컨테이너 기동
```
> docker run -it [IMAGE_NAME] /bin/bash
> docker run -it -p 8080:80 [IMAGE_NAME] /bin/bash
> docker run -it --name [CONTAINER_NAME] [IMAGE_NAME] /bin/bash
```

* Docker 컨테이너 기동
```
docker start [OPTION] CONTAINER [CONTAINER...]
```
  * -a, --attach : 기동과 동시에 컨테이너 접근 (Attach까지만 조작가능: 'Ctrl-c'로 나올 필요가있음)
  ```
  docker start -a ariari
  ```
  * -i, --interactive : 기동과 동시에 컨테이너 접근 (인터렉티브 모드)
  ```
  docker start -i ariari
  ```
* Docker Image 삭제
```
docker rmi [IMAGE_ID]
```

### DockerFile
* DockerFile
```
# 사용 이미지 지정
FROM centos
# DockerHub유저 정보
MAINTAINER Admin <admin@admin.com>
# RUN: docker build 할 때 실행
RUN echo "now building..."
# CMD: docker run 할 때 실행
CMD echo "now running..."
```
* DockerFile build
```
> docker build -t [USER_NAME]/[IMAGE_NAME] .
> docker build -t admin/echo .
```

### practice
#### docker-httpd
* 빌드
```
> docker build -t foxdirector/httpd .
```
* 실행
```
> docker run -p 8080:80 -d foxdirector/httpd
```

### List all exited docker container

#### Start and attache exited docker container
```
> docker start <container_ID>
> docker ps
> docker attach <container_ID>
```
#### Start exited container with docker start command
```
> docker ps -f "status=exited"
> docker start -a <container_ID>
```

## ref
* TODO
http://pppurple.hatenablog.com/entry/2016/07/11/051626
* Command
https://qiita.com/spesnova/items/8121615d4634500a331c
https://qiita.com/hihihiroro/items/d7ceaadc9340a4dbeb8f
* dockerfile
http://pppurple.hatenablog.com/entry/2016/07/11/051626
https://qiita.com/kooohei/items/f0352f408056861a8f74
* dockerfile nginx
https://github.com/roylines/docker-nginx/blob/master/Dockerfile
