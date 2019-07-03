

# HISTORY
```shell
> docker pull mysql:5.7
> docker save [image] > dockermysql.tar
> docker load < dockermysql.tar
sudo docker run -v /home/enpharos/docker/mysql/init:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=mysql -p 43306:3306 --name mysql mysql:5.7

sudo docker run -it --name mysql_hoge mysql:5.7 /bin/bash
```


sudo docker inspect -f {{.Id}} 3277c2d6b6f9
sudo docker inspect -f {{.Volumes}} 3277c2d6b6f9
/var/lib/docker/volumes/0caa2b67513da694866a630f9de5a71e0ebe1af0c8c6ace26c2ba11044119cad/_data


> apt-get update
> atp-get install openssh-server

> service mysql status
> service mysql restart


> grant all privileges on hogedb.* to hogehoge@localhost identified by 'hogehoge';
> grant all privileges on hogedb.* to hogehoge@'%' identified by 'hogehoge';
> select user, host, password from mysql.user;


> mysql -u hogehoge -phogehoge
> create database hogedb;
> show databases;

괧?괧갆긢??긹?긚먝뫏
> use hogedb;

괧?괨갆긡?긳깑띿맟
> create table testtbl(num int, name varchar(50));
> show tables;

괧?괪갆긢??볺쀍
> insert into testtbl values(1, 'hogehoge');
> select * from testtbl;

괧?괫갆긢??뛛륷
> update testtbl set name='higehige' where num = 1;
> select * from testtbl;

괧?괮갆긢??랁룣
> delete from testtbl where num = 1;
> select * from testtbl;

괧?괯갆긡?긳깑랁룣
> drop table testtbl;
> show tables;

괧?괰갆긢??긹?긚랁룣
> drop database hogedb;
> show databases;
==============================

3. 긢??긹?긚궻깇?긗?랁룣
> mysql -u root -pPassword
> revoke all privileges on *.* from hogehoge@localhost;
> delete from mysql.user where user='hogehoge' and host='localhost';
> select user, host, password from mysql.user;
