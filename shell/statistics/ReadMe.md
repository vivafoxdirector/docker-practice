# 실행방법
## Docker 설치
1. Windows 버전 설치
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

2. [실행] 명령어 실행하면 자동으로 docker-compose 설치될 것임.

## 실행
문구앞에 '**'붙은거만 주로 사용함
```sh
$> cd statistics

# **Docker 빌드 (Dockerfile빌드)
$> docker-compose build

# 이전 결과물 삭제 (탐색기에서 삭제해도됨.)
$> erase shell/output

# **Docker 기동(즉, 쉘이 기동됨) (-d 옵션 백그라운드로 실행)
# 작성한 쉘은 실제 여기서 기동됨
# 이후 쉘을 수정할 경우 해당 명령어만 하면 됨.
$> docker-compose up -d

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

