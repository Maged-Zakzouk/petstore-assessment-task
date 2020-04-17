FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /mypetstore

WORKDIR /mypetstore

COPY Gemfile /mypetstore/Gemfile

COPY Gemfile.lock /mypetstore/Gemfile.lock

RUN bundle install

COPY . /mypetstore
