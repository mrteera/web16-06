FROM ruby:2.3.1
MAINTAINER web16

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs \
    ca-certificates bzip2 libfontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/phantomjs.tar.bz2 https://assets.membergetmember.co/software/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mkdir /tmp/phantomjs
RUN tar --strip-components=1 -C /tmp/phantomjs -xjf /tmp/phantomjs.tar.bz2
RUN mv /tmp/phantomjs/bin/phantomjs /usr/local/bin/

ENV APPLICATION_ROOT /app
RUN mkdir $APPLICATION_ROOT
WORKDIR $APPLICATION_ROOT

ADD Gemfile /$APPLICATION_ROOT/Gemfile
ADD Gemfile.lock /$APPLICATION_ROOT/Gemfile.lock
RUN bundle install
RUN rails db:create db:migrate db:seed
COPY ./compose/rails/entrypoint.sh /entrypoint.sh
COPY ./compose/rails/start-dev.sh /start-dev.sh
ADD . /$APPLICATION_ROOT
