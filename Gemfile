source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'settingslogic'

gem 'dinchi-models'#, :git => 'git@bitbucket.org:srosu/dinchi-models.git',:branch => 'master'
gem 'bugsnag'

gem 'angular-rails-templates'
gem 'bower-rails'

group :development do
  gem 'traceroute'
  # gem 'bullet'
  gem 'brakeman'
  # gem 'rubycritic'
  # gem 'rack-mini-profiler'
  gem 'capistrano', '~> 3'
  gem 'capistrano-rvm', '~> 0.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1'
  # gem 'capistrano-unicorn'#, :require => false
  gem 'capistrano3-unicorn'#, :require => false
  gem 'capistrano-bower'
end

group :staging, :production do
  gem 'unicorn'
  gem 'whenever', :require => false
end

group :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spring'
  gem 'rspec-rails'
  gem 'factory_girl'

  gem 'terminal-notifier-guard'
  gem 'rb-fsevent'
  gem 'faker'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'vcr'
  # gem 'webmock'
  gem 'cucumber-rails', :require => false
end

gem 'newrelic_rpm'
