FROM openjdk:11

ARG SBT_VERSION=1.4.9

# Install sbt
RUN \
  mkdir /working/ && \
  cd /working/ && \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  cd && \
  rm -r /working/ && \
  sbt sbtVersion

RUN mkdir -p /root/build/project
# ADD build.sbt /root/build/
#ADD ./project/plugins.sbt /root/build/project

CMD ["/bin/bash"]
## RUN cd /root/build && sbt compile

#EXPOSE 9000
#WORKDIR /root/build

#CMD sbt compile run