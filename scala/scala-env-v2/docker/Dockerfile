FROM hseeberger/scala-sbt:8u222_1.3.5_2.13.1

ARG SBT_VERSION=1.4.9

# Install sbt
RUN \
  sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/com-lihaoyi/Ammonite/releases/download/2.4.0/2.13-2.4.0-23-76673f7f) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && \
  apt-get -y install zsh && \
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# WORK DIR
WORKDIR /usr/src

# CMD ["/bin/zsh"]
# CMD ["amm"]