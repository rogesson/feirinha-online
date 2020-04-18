#!/bin/bash

bundle check || bundle install

tail -f /dev/null

bundle exec rake db:setup && \
bundle exec rails s -p 3000 -b '0.0.0.0' -P /tmp/rails.pid
