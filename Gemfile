source 'http://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Asset template engines
group :assets do
  gem 'sass'
  gem 'coffee-script'
  gem 'uglifier'
  gem 'sprockets'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development do
  gem 'common_deploy', 
    :git => 'git@github.com:adyard/common_deploy.git', 
    :require => false
  gem 'capistrano', '<3.0'
end
