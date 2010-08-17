source 'http://rubygems.org'

gem 'rails', '3.0.0.rc'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

gem "haml", ">= 3.0.12"
gem "haml-rails"
gem 'acts-as-taggable-on'
gem 'compass', ">= 0.10.4"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

group :test do
  gem "factory_girl_rails", ">= 1.0.0", :group => :test
  gem "rspec-rails", ">= 2.0.0.beta.12", :group => :test
end

group :production do
  gem 'pg'
end
