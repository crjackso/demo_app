source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.3'

group :development, :test do
  gem 'rspec-rails', '2.9.0'
  gem 'database_cleaner', '1.2.0'
  gem 'factory_girl_rails', '4.4.1'
end

gem 'sass-rails', '4.0.2'
gem 'uglifier', '2.1.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '2.0.4'
gem 'country_select'
gem 'email_validator', '1.4.0', :require => 'email_validator/strict'
gem 'hashids', '0.3.0'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :test do
  gem 'sqlite3', '1.3.9'
end

group :development, :prodution do
  gem 'pg', '0.17.1'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end