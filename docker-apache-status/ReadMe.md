
# Docker Apache
## Issue
* 이슈
$ systemctl
Failed to get D-Bus connection: Operation not permitted
* 해결방안

--privileged를 붙여주면 기동이 된다.
> docker run -p 8080:80 --privileged --name centos -d centos /sbin/init
> docker exec -ti centos bash
* 참조: https://qiita.com/setouchi/items/6bfa116fc5a266856177

## Apache 명령어 
> systemctl start httpd
> systemctl status httpd
> systemctl restart httpd

## Apache Module 


내용: Apache상황 모니터링 설정 방법
참조: http://think-t.hatenablog.com/entry/20101002/1285999147
참조: https://www.adminweb.jp/apache/status/index1.html
참조: https://torina.top/detail/211/

내용: 
참조: https://qiita.com/setouchi/items/6bfa116fc5a266856177

내용:
참조: https://httpd.apache.org/docs/2.4/ja/mod/mod_status.html
참조: https://qiita.com/macer_fkm/items/dda5e343e19c432a1ccd


### 모든 아이피에서 접속 하도록 한다.
<Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from all
</Location>
