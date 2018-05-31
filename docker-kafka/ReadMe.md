# Docker

> sudo docker pull centos:latest
> sudo docker run -it --name kafka-practice centos:latest /bin/bash

> yum update -y
> yum search java
> yum install java-1.8.0-openjdk
> yum install wget
> cd ~/
> wget https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.tgz
> tar xvfz scala-2.12.6.tgz
> mv scala-2.12.6 /usr/local/scala
> export PATH=$PATH:/usr/local/scala/bin
> scala -version
> ::: bash_profile ::: Add Path of Scala/bin
>
> ::: Kafka setting
> wget http://mirror.apache-kr.org/kafka/1.1.0/kafka_2.12-1.1.0.tgz
> tar xvfz kafka_2.12-1.1.0.tgz
> mv kafka_2.12-1.1.0 /opt
> cd /opt/kafka_2.12-1.1.0
>
> :::: START Zookeeper (-daemon =:= nohup)
> bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
>
> vi bin/kafka-server-start.sh
> :EDIT: -Xmx256M -Xms128M
>
> :::: Start the Kafka server
> bin/kafka-server-start.sh config/server.properties
> => bin/kafka-server-start.sh -daemon config/server.properties
> :[SUCCESS]: INFO [Kafka Server 0], started (kafka.server.KafkaServer)
>
> :::: Create a topic "test" in a new SSH connection
> => Open a new SSH connection, use the following commands to create a topic 'test'
> cd /opt/kafka_2.12-1.1.0
> bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
> => You can view your topics with the following command.
> bin/kafka-topics.sh --list --zookeeper localhost:2181
> => In our case. The output will read
> test
> :::: Delete topic
> bin/kafka-topics.sh --delete --zookeeper localhost:2181 --topic [topic-name]
>
> :::: Produce messages using the topic "test"
> bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
> => Using the command above. you can input any number of messages as you wish. such as
> Welcome aboard!
> AriAri
> => If you receive an error similar to "WARN Error while fetching metadata with correlation id" while inputting a message. you'll need to update the [server.properties] file with the following info:
> port = 9092
> advertised.host.name = localhost
> 
> :::: Display messages
> => Open a third SSH connection. and then run the following commands:
> cd /opt/kafka_2.12-1.1.0
> bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
>
>

