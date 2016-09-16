FROM ruby:2.3.1
MAINTAINER web16

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs \
    ca-certificates bzip2 libfontconfig git-core \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/phantomjs.tar.bz2 https://assets.membergetmember.co/software/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mkdir /tmp/phantomjs
RUN tar --strip-components=1 -C /tmp/phantomjs -xjf /tmp/phantomjs.tar.bz2
RUN mv /tmp/phantomjs/bin/phantomjs /usr/local/bin/


#RUN git clone https://github.com/mrteera/web16-06.git --depth 20 -b master /web16-06
ADD . /web16-06
ENV APPLICATION_ROOT /web16-06/PS/ps1
WORKDIR $APPLICATION_ROOT
RUN bundle install

COPY ./compose/rails/entrypoint.sh /entrypoint.sh
COPY ./compose/rails/start-dev.sh /start-dev.sh
