# Docker-practice

# 명령어
## Docker Hub
id: vivafoxdirector
pass: s0m2..

id: foxdirector  => 잘 안씀
pass: n0th..

## Docker기본
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
* Docker 컨테이너 정보 확인
```
> docker inspect [CONTAINER_ID]
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

## 이미지 제어
* Docker Image 삭제
```
docker rmi [IMAGE_ID]
```

* 이미지 확인
> docker images

* 이미지 검색
> docker search [keyword]
예) > docker search centos

* Docker Hub에서 이미지 가져오기
> docker pull ubuntu:latest
> docker pull centos:7
==>tag명을 생략하면 최신(latest)를 가져옴.

* 이미지는 어디에 저장이 되나???
> cd /var/lib/docker/image/.../*.json 파일 확인
> docker images 해서 나온 ImageId에 해당하는 것을 찾으면 있는듯하다

* 이미지를 실행 -> 컨테이너 작성하기
> docker run [옵션] [--name {컨테이너명}] {이미지명} [: {태그명} [컨테이너 실행 명령어] [인수]
> docker run -it --name ubuntu1 ubuntu /bin/bash
> docker run -it --name ubuntu1 -p 8080:80 ubuntu

* 이미지 삭제 
> docker rmi [images]

* 이미지를 파일로 저장하기
> docker images <--- 이미지 확인
> docker save [image] > filename.tar

* 파일을 이미지로 반영하기
> docker load < filename.tar

## 컨테이너 제어
* 컨테이너 일람(실행중에 있는 컨테이너 목록 표시)
> docker ps [-a]

* 컨테이너에서 systemctl 명령어가 안되는 경우 아래와 같이 한다.
참조: http://qiita.com/setouchi/items/6bfa116fc5a266856177
참조: http://qiita.com/yunano/items/9637ee21a71eba197345
> docker run --privileged --name [컨테이너명] -d [이미지명] /sbin/init
> docker exec -ti [컨테이너명] bash

* 컨테이너 명령어실행
> docker exec -it [container] [command]

* 컨테이너 정지
> docker stop [container]

* 컨테이너 기동
> docker start [container]

* 컨테이너 재기동
> docker restart [container]

* 컨테이너 삭제
> docker rm [container]

* 기동중에 있는 컨테이너 접속
> docker attach [container]

* 레포지토리 tag 부여하기(:TAG 생략하면 latest가 됨)
> docker tag IMAGE REPOSITORY[:TAG]

* 컨테이너에서 나오기 (exit 는 프로세스가 중지됨)
> [Ctrl] + [p], [q]
 
* 배시프로세스 중지(>exit 와 같음)
> [Ctrl] + [d]

* 컨테이너를 이미지로 저장
> docker commit [컨테이너명/ID] [이미지명]:[태그명]
예)
> docker commit ttatest1 ttatest
> docker commit default centos:httpd

* 컨테이너명 바꾸기
> docker rename [현재컨테이너명] [바꿀컨테이너명]

## 컨테이너 <-> 호스트
* 컨테이너에서 호스트로 파일 카피
```
$ sudo docker ps
$ sudo docker cp <컨테이너ID>:/etc/my.cnf my.cnf
```
## Docker Compose
# 실행방법

## Docker 설치
1. Windows 버전 설치
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

2. [실행] 명령어 실행하면 자동으로 docker-compose 설치될 것임.

## 디렉구조
```
├── docker
│   └── Dockerfile              => [Docker설정파일]
├── shell
│    ├── output                 => 런타임중에 생성되는 디렉토리이고, 쉘의 결과물이 출력된다.
│    ├── 1020.sh                => 10월 20일 요청받은 '클래스 개설 실적'통계 쉘이다.
│    └── OFEC_MVL_STAT.sh       => 실제 도커내에서 실행되는 쉘 (상황에 맞게 수정한다.)
└── docker-compose.yml          => [Docker설정파일]
```

## 수정항목
1. shell
shell디렉토리에 작업할 shell파일을 위치 시킨다. (예제는 화상통계를 하는 OFEC_MVL_STAT.sh 이다.)

2. Dockerfile
Dockerfile 내에 지정된 쉘 파일명을 하나만 지정한다.

2. 
## 실행
1. 쉘은 내부적으로 MySQL 을 이용하고, EBS DB에 연결하기 때문에 "DBSAFER"가 구동되어 있어야 함.

2. 실행 명령어
문구앞에 '**'붙은거만 주로 사용함
```sh
# 1. Dockerfile 수정
# /docker/Dockerfile 수정한다.(실행하고자 하는 쉘로 구동되도록)

$> cd statistics

# **Docker 빌드 (Dockerfile빌드)
$> docker-compose build  # => 오래걸림.. 처음에만 그럼

# docker version 상위에서 아래 명령어로 가능하게 됨.
$> docker compose build

# 이전 결과물 삭제 (탐색기에서 삭제해도됨.)
$> erase shell/output

# **Docker 기동(즉, 쉘이 기동됨) (-d 옵션 백그라운드로 실행)
# 작성한 쉘은 실제 여기서 기동됨
# 이후 쉘을 수정할 경우 해당 명령어만 하면 됨.
$> docker-compose up -d

# docker version 상위에서 아래 명령어로...
$> docker compose up -d

# ** 여기서 정상동작되지 않으면 파일 포맷을 unix로 바꿔본다.=> Dockerfile 에 설정해둠.
$> dos2unix [파일명]
ex) dos2unix DELETE_DATA_IN_INJSE_LRN_TABLE.sh

# 다시 실행할 경우
$> docker-compose start

# 중지
$> docker-compose stop

# **Docker 전체 삭제
$> docker-compose down --rmi all --volumes --remove-orphans
```

## 결과물
'docker-compose up -d' 실행하면 결과는 아래의 경로에 남겨짐.
경로: statistics/shell/output

※ 다시 쉘을 기동했을경우 위 경로는 반드시 삭제하고 실행한다.


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
```s
$> docker build -t [IMAGE_NAME] .
$> docker build -t centos .
$> docker build -t [USER_NAME]/[IMAGE_NAME] .
$> docker build -t admin/echo .
```

### practice
#### docker-httpd
* 빌드
```s
$> docker build -t foxdirector/httpd .
```
* 실행
```s
$> docker run -p 8080:80 -d foxdirector/httpd
```

#### alpine
* 컨테이너 생성
```s
$> docker run --it <container name> <imagename> /bin/ash
```
### List all exited docker container

#### Start and attache exited docker container
```s
$> docker start <container_ID>
$> docker ps
$> docker attach <container_ID>
```
#### Start exited container with docker start command
```s
$> docker ps -f "status=exited"
$> docker start -a <container_ID>
```

## ref
* TODO
http://pppurple.hatenablog.com/entry/2016/07/11/051626
* Command
https://qiita.com/spesnova/items/8121615d4634500a331c
https://qiita.com/hihihiroro/items/d7ceaadc9340a4dbeb8f
* dockerfile
https://knowledge.sakura.ad.jp/15253/
http://pppurple.hatenablog.com/entry/2016/07/11/051626
https://qiita.com/kooohei/items/f0352f408056861a8f74
* dockerfile nginx
https://github.com/roylines/docker-nginx/blob/master/Dockerfile


■ 참조
1. Docker Hub
https://hub.docker.com/


■ Docker 설정 (CentOS)
1. Docker 기동
> service docker start

2. 이미지(우분투) 설치
> sudo docker pull ubuntu:latest

■ Docker 명령어

■ Docer 컨테이너 정보 취득
1. IP 취득 (컨테이너별)
> docker ps -a <--- 컨테이너 ID확인
> docker inspect --format '{{ .NetworkSettings.IPAddress }}’ [컨테이너ID]

■ Docker 트러블슈팅
1. pull할때 오류 해결방법
△ 문제

> sudo docker pull ubuntu:latest
> Pulling repository ubuntu
> Get https://index.docker.io/v1/repositories/library/ubuntu/images: dial tcp: lookup index.docker.io: Temporary failure in name resolution

△ 해결 (/etc/sysconfig/network-scripts/ifcfg-ethX파일 수정)
DNS1=8.8.8.8
DNS2=8.8.4.4

■ 이미지에 유틸리티 설치
1. ping 명령어 설치
> apt-get install iputils-ping

■ TTA 테스트 방법
■ JMeter TTA 테스트 (과부하 테스트)
과부하 테스트시에는 JMeter를 Master/Slave 로 구축하여 테스트 한다.
아래의 순서대로 행해야 테스트가 가능함.

①  TTA용 이미지를 이용하여 컨테이너를 구동(TTA TEST용은 4개의 컨테이너를 구동시킨다)
> sudo docker run -it --name ttatest1 ttatest /bin/bash
> sudo docker run -it --name ttatest2 ttatest /bin/bash
> sudo docker run -it --name ttatest3 ttatest /bin/bash
> sudo docker run -it --name ttatest4 ttatest /bin/bash

② 이미지 제대로 실행되었는지 컨테이너 확인
> sudo docker ps -a
=> STATUS 가 Exit이면 Stop상태 / Up이면 Started상태
★ Started 상태에서 IP취득이 가능하고, 컨테이너를 Stop하고 다시 Start하게 되면 IP가 전과 다르게 셋팅이 된다. Start하면 다시 IP확인을 해야한다.

③ 각 컨테이너 기동
> sudo docker start [container id]

③ 각 컨테이너 ip확인
> sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' [컨테이너 ID]

⑤ 컨테이너 IP를 JMeter Master에 설정
path: /home/okman/apache-jmeter-2.13/bin
편집: jmeter.properties 를 수정
remote_hosts=172.17.0.X,172.17.0.X,172.17.0.X,172.17.0.X

⑥ 각 컨테이너 JMeter Slave 설정
path: /home/apache-jmeter-2.13/bin
편집: jmeter-server 에 해당 컨테이너 IP를 아래의 항목에 설정한다.
RMI_HOST_DEF=-Djava.rmi.server.hostname=172.17.0.X

⑥ 각 컨테이너 JMeter 타겟대상 IP/PORT 설정
path: /home/apache-jmeter-2.13/tta_test_data
file: /AGENT_TP_TEST.jmx 을 아래와 같이 수정한다.
편집)
--------------------------------------------------------------------------
...
<stringProp name="TCPSampler.server">[[부하대상 IP지정]]</stringProp>
...
<stringProp name="TCPSampler.port">[[부하대상 PORT지정]]</stringProp>
...
--------------------------------------------------------------------------

예제)
--------------------------------------------------------------------------
...
<stringProp name="TCPSampler.server">49.238.248.53</stringProp>
...
<stringProp name="TCPSampler.port">5050</stringProp>
...
--------------------------------------------------------------------------

⑦ JMeter Master 기동
1) JMeter를 기동
2) 부하를 가할 대상 IP와 PORT를 설정
3) JMeter Slave 기동(JMeter Slave IP 모두 수행)
  메뉴 -> Run -> Remote Start -> 172.17.0.X ~ 172.17.0.X
4) JMeter Start 버튼 클릭

# 참고사이트
## Docker 기본
1. Docker
- [Install Docker on CentOS 7](https://qiita.com/ymasaoka/items/b6c3ffea060bcd237478)
- [Installing Docker on CentOS 8](https://www.vadmin-land.com/2019/09/installing-docker-on-centos-8/)

2. DockerFile
- [Dockerfileによるビルド](https://www.tohoho-web.com/docker/dockerfile.html#shell)

2. Docker Compose
- [docker-compose](https://qiita.com/uggds/items/5e4f8fee180d77c06ee1)
- [docker-compose](https://knowledge.sakura.ad.jp/16862/)
- [Docker compose ことはじめハンズオン](https://qiita.com/TsutomuNakamura/items/7e90e5efb36601c5bc8a)

3. Redis
- [redis-cli コマンド操作まとめ](https://qiita.com/rubytomato@github/items/d66d932959d596876ab5)
- [Docker compose ことはじめハンズオン](https://qiita.com/TsutomuNakamura/items/7e90e5efb36601c5bc8a)

## Docker 개념
1. windows containers vs linux containers
- [[Windows 컨테이너] 1: Windows 컨테이너에 대한 이해](https://tech.devsisters.com/posts/intro-windows-container/)

## TipTech
1. docker-compose command 과 dockerfile cmd 어느게 우선하나? docker-compose command가 최 우선이다.
- [DockerfileのCMD、docker-compose.yamlのcommandに、複数コマンドを複数行で書く](https://miuuuu.hatenablog.com/entry/2020/03/21/013627)

2. Mysql 문자셋 설정
- [dockerのMySQLのutf8文字コードのイメージを作る](https://daichan.club/docker/78379)
  - [윈도우 환경에서 MySQL 한글 설정하기(UTF-8)](https://happy-inside.tistory.com/112)
  - [예제] yian/docker-practice/shell/helloworld/docker/Dockerfile/mysqld_charset.cnf


## 트러블슈팅(20230405)
1. Docker-compose build 시 "no such file or directory"발생시 댕으
- [[Docker/Python]Could not open requirements file: [Errno 2] No such file or directory: でDocker buildに失敗したときの対処法](http://pixelbeat.jp/could-not-open-requirements-file-with-docker-using-python/)