# Docker Apache Status
## 설정방법
### Docker 설정
#### 이미지 가져오기
```
> docker pull vivafoxdirector/apache-status
```
#### 컨테이너 생성
```
> docker run -p 8080:80 --privileged --name apache-status -d vivafoxdirector/apache-status /sbin/init
```
#### 컨테이너 bash 기동
```
> docker exec -ti apache-status bash
```
### Apache 설정
*아래의 설정방법은 Docker Image(vivafoxdirector/apache-status)에 포함되어 있고,
Image를 docker pull 하고 컨테이너만 생성하면 기본적인 설정은 되어 있다.*

#### Apache 버전확인
```
> httpd -v
```
#### Apache 설치
```
> yum -y install httpd
```
#### httpd.conf 설정
```
> vi /etc/httpd/conf/httpd.conf
..
LoadModule status_module modules/mod_status.so
..
```
#### httpd-info.conf (파일이 없으면 새로 생성 한다.)
```
> vi /etc/httpd/conf.modules.d/httpd-info.conf
..
<Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from all
</Location>
..
```
* SetHandler: 사용할 module명을 지정 [ex) server-info, server-status....]
* Order : 접근제어 순서 지정 ({허락,제한=allow,deny}, {제한,허락=deny,allow})
* Deny from : 제한하는 아이피 지정, 또는 모든 아이피에 대해서 제한은 all
* Allow from : 제한하는 아이피 지정, 또는 모든 아이피에 대해서 허락은 all

#### Apache 재기동
```
# CentOS
> systemctl status httpd
> systemctl restart httpd

# Other Linux
> service httpd start
> service httpd stop
```
#### Apache Status 확인
##### 기본 정보 확인
```
> http://[ip]:8080/server-status
```

##### Interval설정으로 refresh표시
```
> http://[ip]:8080/server-status?refresh=5 (5초 마다)
```

##### 상태파일 표시 (별도의 프로그램에서 읽기 위함)
```
> http://[ip]:8080/server-status?auto
> http://[ip]:8080/server-status?auto&refresh=5
```

## Issue Tracking
### 1. Docker Centos에서 Systemctl 명령어 오류
* 현상
```
> systemctl
Failed to get D-Bus connection: Operation not permitted
```
* 해결방안: docker container를 생성할 때 --privileged 옵션을 추가한다.
```
> docker run -p 8080:80 --privileged --name centos -d centos /sbin/init
> docker exec -ti centos bash
```
* 참조: https://qiita.com/setouchi/items/6bfa116fc5a266856177

## Apache 명령어
> systemctl start httpd
> systemctl status httpd
> systemctl restart httpd

* RealTime 요청
http://localhost:45000/pharos?ui_type=realtime&data_name=OVERVIEW&data_subname=APACHE&agent_name=MYAPACHE&isRealtime=true



command.properties

url:/pharos
PharosControlServlet::doPost
RealtimeCommand::execute
OverviewBean::execute

OverviewBean::execute=>OverviewBean::getApacheOverview=>ApacheAgent::getRealtimeXML=>ApacheStatus::toXML

## Apache Module
내용: Apache상황 모니터링 설정 방법
참조: http://think-t.hatenablog.com/entry/20101002/1285999147
참조: https://www.adminweb.jp/apache/status/index1.html
참조: https://torina.top/detail/211/
참조: https://www.softel.co.jp/blogs/tech/archives/4230
참조: http://software.fujitsu.com/jp/manual/manualfiles/M060041/B1WN7141/02Z200/ihs02/ihs00014.htm

내용: Apache2
참조: https://www.digitalocean.com/community/questions/unable-to-get-server-status-mod-working-with-apache2-on-ubuntu
참조: https://www.tecmint.com/check-apache-httpd-status-and-uptime-in-linux/
참조: https://askubuntu.com/questions/256013/apache-error-could-not-reliably-determine-the-servers-fully-qualified-domain-n/396048

내용:
참조: https://qiita.com/setouchi/items/6bfa116fc5a266856177

내용:
참조: https://httpd.apache.org/docs/2.4/ja/mod/mod_status.html
참조: https://qiita.com/macer_fkm/items/dda5e343e19c432a1ccd

내용: ScoredBoard 모니터링
참조: https://aoishi.hateblo.jp/entry/2018/01/07/080000

내용: nginx 서버정보
참조: https://www.cyberciti.biz/faq/howto-unix-linux-convert-dos-newlines-cr-lf-unix-text-format/
