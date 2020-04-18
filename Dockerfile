FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p  /var/www/feirinha-online

WORKDIR /var/www/feirinha-online

ADD Gemfile /var/www/feirinha-online/Gemfile

RUN bundle install

ADD . /var/www/feirinha-online