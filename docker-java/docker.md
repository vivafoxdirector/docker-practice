# Docker Java
## 구성
```
├── docker
│   └── java
│       └── Dockerfile
├── docker-compose.yml
└── server
    └── src
        ├── Main.class
        └── Main.java
```

## 순서
1. docker-compose.yml 작성
```yml
version: '3.6'
services:
  java:
    build: ./docker/java
    ports:
      - 8080:8080
    tty: true
    volumes:
      - ./server/src:/usr/src:cached
```
2. Dockerfile 작성
```s
FROM openjdk:11-slim

RUN apt-get update
WORKDIR /usr/src
```

3. 테스트 코드
```java
public class HelloWorld {
    public static void main(String... args) {
        System.out.println("Hello World!");
    }
}
```

4. Docker기동
```s
// docker빌드
% docker-compose build

// docker백그라운드로 실행
% docker-compose up -d

// 확인
% docker-compose ps
Name          Command   State           Ports         
---------------------------------------------------------
java-spring_java_1   jshell    Up      0.0.0.0:8080->8080/tcp
```

5. 컴파일 and 실행
```s
// inspection
% docker-compose exec java bash

// compile
root@5b7be900c329:/usr/src# javac Main.java

// execute
root@5b7be900c329:/usr/src# java Main
Hello World!
```

## DockerFile
1. v0.5
```s
FROM centos:centos7

RUN yum -y install java vim
```
# 참조사이트
- [Docker × Java シンプルすぎる開発環境構築](https://qiita.com/A-Kira/items/0dda255e00771f556e2a)