FROM postgres:9.6.1-alpine

MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-node)
LABEL description="Postgres image 9.6.1"

RUN apk --no-cache add -U ca-certificates openssl && update-ca-certificates
RUN apk --no-cache add -U \
  bash \
  vim \
  wget \
  curl \
  tzdata

COPY ./bash_aliases /root/.bashrc
COPY ./vimrc /root/.vimrc
RUN ln -sf /usr/bin/vim /usr/bin/vi
