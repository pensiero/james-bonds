FROM ruby:2.3.1

MAINTAINER Oscar Fanelli <oscar.fanelli@gmail.com>

ENV INSTALL_PATH /usr/src/app

# Essential needs
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential \
      nodejs \
      libpq-dev

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
COPY . .