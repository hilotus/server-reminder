source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'rack-cors', :require => 'rack/cors'

gem 'mongoid'
gem 'bson_ext'
gem 'rjb'

gem 'baidu_push', :git => 'https://github.com/hilotus/baidu_push.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails', '~> 3.2.3'
gem 'jquery-rails'

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
end

gem "rspec-rails", :group => [:test, :development]

# use resque
gem 'redis'
gem 'resque', '~> 1.25.2', :require => 'resque/server'
gem 'resque-scheduler', '~> 3.0.0'

# Deploy with Capistrano
gem 'unicorn'
group :development do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-bundler', '~> 1.1.0'
  gem 'capistrano-rvm'
end
