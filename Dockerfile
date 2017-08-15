FROM postgres:9.6.4-alpine

MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-postgres)
LABEL description="Postgres image 9.6.4"

COPY ./bash_aliases /root/.bashrc
COPY ./vimrc /root/.vimrc
COPY ./pgpass /root/.pgpass

RUN apk --no-cache add -U \
    ca-certificates \
    openssl \
  && update-ca-certificates \

  && apk --no-cache add -U \
    bash \
    vim \
    wget \
    curl \
    tzdata \
    python \
    py-pip \

  && pip install awscli --upgrade --user \

  && chmod 600 /root/.pgpass \
  
  && ln -sf /usr/bin/vim /usr/bin/vi
