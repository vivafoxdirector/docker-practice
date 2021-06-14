FROM openjdk:11

ARG SBT_VERSION=1.4.9
# Install follow
# 1. openjdk:11
# 2. zip & unzip
# 3. sdkman
# => https://sdkman.io/
# 4. sbt
# => https://www.scala-sbt.org/1.x/docs/ja/Installing-sbt-on-Linux.html
# 5. ammonite
# => https://ammonite.io/#Ammonite-REPL
# 6. ohmyzsh
SHELL ["/bin/bash", "-c"] 

RUN \
    # source : error 날때 아래 방법 고려가능
    # rm /bin/sh && ln -s /bin/bash /bin/sh && \
    # => https://stackoverflow.com/questions/20635472/using-the-run-instruction-in-a-dockerfile-with-source-does-not-work
    apt-get update && \
    apt-get install -y zip unzip && \
    curl -s "https://get.sdkman.io" | bash && \
    source /root/.sdkman/bin/sdkman-init.sh && \
    sdk install java $(sdk list java | grep -o "8\.[0-9]*\.[0-9]*\.hs-adpt" | head -1) && \
    sdk install sbt && \
    sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/com-lihaoyi/Ammonite/releases/download/2.4.0/2.13-2.4.0) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && \
    apt-get install -y zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["/bin/zsh"]

# Execute
# $> docker build -t yian-dev:scala .