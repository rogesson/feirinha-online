#!/bin/bash

bundle check || bundle install

bundle exec rake db:migrate && \
bundle exec rails s -p 80 -b '0.0.0.0' -P /tmp/rails.pid
