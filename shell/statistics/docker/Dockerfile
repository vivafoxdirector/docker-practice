FROM ubuntu:latest

# MySQL
RUN \
    apt-get update && \
    apt-get install -y mysql-server mysql-client

# MySQL start
# service mysql start

# WORK DIR
WORKDIR /usr/src

# CMD
CMD ["/usr/src/OFEC_MVL_STAT.sh"]

# TEMP
#COPY helloworld.sh /root
#RUN chmod +x /root/helloworld.sh
#RUN echo "hello World..." > /root/output/test.txt