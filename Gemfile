source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.15'
gem 'devise'
gem 'pundit'
gem 'omniauth-twitter'
gem 'figaro'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'pry'
end

group :development, :test do
  gem "minitest-rails"
  gem "minitest-rails-capybara"
  gem "sqlite3"
  gem 'launchy'
  gem 'capybara-webkit'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'simplecov', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
