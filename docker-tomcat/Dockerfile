FROM alpine:3.9
MAINTAINER yian

ENV TOMCAT_MAJOR=8 \
	TOMCAT_VERSION=8.5.38 \
	TOMCAT_HOME=/opt/tomcat \
	CATALINA_HOME=/opt/tomcat
	#MYSQL_JDBC_VERSION=5.1.39 \
    #POSTGRESQL_JDBC_VERSION=9.4.1207

RUN mkdir -p /opt && \
    apk upgrade --update && \
    apk add --update openjdk8-jre curl && \
    curl -jksSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -C /opt -xvzf /tmp/apache-tomcat.tar.gz && \
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} && \
    rm -rf ${TOMCAT_HOME}/webapps/* && \
    #curl -jksSL -o /tmp/mysql-connector-java.tar.gz http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_JDBC_VERSION}.tar.gz && \
    #tar -C /tmp -xvzf /tmp/mysql-connector-java.tar.gz && \
    #cp /tmp/mysql-connector-java-${MYSQL_JDBC_VERSION}/mysql-connector-java-${MYSQL_JDBC_VERSION}-bin.jar /opt/tomcat/lib/ && \
    #curl -jksSL -o /opt/tomcat/lib/postgresql-${POSTGRESQL_JDBC_VERSION}.jar http://jdbc.postgresql.org/download/postgresql-${POSTGRESQL_JDBC_VERSION}.jar && \
    apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

EXPOSE 8080
ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh", "run" ]


# Usage
# > docker build -t tomcat8:alpine .