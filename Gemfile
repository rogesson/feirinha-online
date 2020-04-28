# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.10'

# default BackEnd
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'

# default UI
gem 'jbuilder', '~> 2.5'
gem 'redis'
gem 'sass-rails', '~> 5.0'
gem 'therubyracer'
gem 'uglifier', '>= 1.3.0'

gem 'rest-client'
gem 'devise'
gem 'rack-cors'
gem 'simple_token_authentication', '~> 1.0'
gem 'active_model_serializers'

group :development, :test do
  # gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  # gem 'factory_bot'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'sqlite3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
