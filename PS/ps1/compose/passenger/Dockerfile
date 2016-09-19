FROM phusion/passenger-ruby23
MAINTAINER web16

# Set correct environment variables.
ENV HOME /root

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs \
    ca-certificates bzip2 libfontconfig git-core wget

RUN wget -q -O /tmp/phantomjs.tar.bz2 https://assets.membergetmember.co/software/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mkdir /tmp/phantomjs
RUN tar --strip-components=1 -C /tmp/phantomjs -xjf /tmp/phantomjs.tar.bz2
RUN mv /tmp/phantomjs/bin/phantomjs /usr/local/bin/

ADD . /web16-06
ENV APPLICATION_ROOT /web16-06/PS/ps1
WORKDIR $APPLICATION_ROOT
RUN bundle install --without development test

COPY PS/ps1/compose/passenger/entrypoint.sh /entrypoint.sh
COPY PS/ps1/compose/passenger/start-dev.sh /start-dev.sh

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ENV DOCKER_DIR PS/ps1/compose/passenger
ADD $DOCKER_DIR/ps1.conf /etc/nginx/sites-enabled/ps1.conf
ADD $DOCKER_DIR/secret_key.conf /etc/nginx/main.d/secret_key.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
