FROM openjdk:11

ARG SBT_VERSION=1.4.9
# Install follow
# 1. openjdk:11
# 2. zip & unzip
# 3. sdkman
# => https://sdkman.io/
# 4. sbt

RUN \
    apt-get update \
    apt-get install -y zip unzip \
    curl -s "https://get.sdkman.io" | bash \
    source "/root/.sdkman/bin/sdkman-init.sh" \
    sdk install java $(sdk list java | grep -o "8\.[0-9]*\.[0-9]*\.hs-adpt" | head -1) \
    sdk install sbt

CMD ["/bin/bash"]