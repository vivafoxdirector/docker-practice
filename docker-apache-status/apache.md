■ APACHE WEB MONITORING

대상: 45.64.174.195
버전: Apache 2.2.15
```
> httpd -v
```

● 설정작업
1. httpd.conf 설정
> vi /etc/httpd/conf/httpd.conf
* 주석 제거 항목 
1) 모듈설정
```
LoadModule status_module modules/mod_status.so
```
2) 접근 제어
```
 <Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from .example.com
</Location>
```
3) 실행 권한(유저/그룹)
User root 로 변경한다. (이부분은 apache 로 해야할듯)
Group root (이부분은 apache 로 해야할듯)

* 트러블슈팅
1. service httpd start 오류
```
> service httpd start
> httpd (을)를 시작 중: httpd: bad user name apache [실패]
```

1. apachectl status 명령어
```
> apachectl status
```
The 'links' package is required for this functionality.
위의 오류가 나서 
http://www.square-mi.com/wp/category/webserver/apache/
를 확인해보니
elink (텍스트 브라우저?)를 설치 하라고 함.

3. 403 Forbidden 에러
Forbidden
You don't have permission to access /... on this server
> 이는 Document Root 디렉토리 권한을 755로 변경하였다.
