FROM ruby:2.3.1
MAINTAINER web16

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

ENV APPLICATION_ROOT /app
RUN mkdir $APPLICATION_ROOT
WORKDIR $APPLICATION_ROOT

ADD Gemfile /$APPLICATION_ROOT/Gemfile
ADD Gemfile.lock /$APPLICATION_ROOT/Gemfile.lock
RUN bundle install
COPY ./compose/rails/entrypoint.sh /entrypoint.sh
COPY ./compose/rails/start-dev.sh /start-dev.sh
ADD . /$APPLICATION_ROOT
