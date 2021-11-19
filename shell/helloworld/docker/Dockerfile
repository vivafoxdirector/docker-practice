FROM ubuntu:latest

# MySQL
RUN \
    apt-get update && \
    apt-get install -y dos2unix && \
    apt-get install -y mysql-server mysql-client

# MySQL start
# service mysql start

# WORK DIR
WORKDIR /usr/src

# CMD
## Dosfile to UnixFile (한글관련 처리시 필요)
# RUN dos2unix /usr/src/helloworld.sh
## TASK 기동
CMD /bin/bash -c "dos2unix /usr/src/helloworld.sh && /usr/src/helloworld.sh"

# TEMP
#COPY helloworld.sh /root
#RUN chmod +x /root/helloworld.sh
#RUN echo "hello World..." > /root/output/test.txt