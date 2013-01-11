source 'http://rubygems.org'

gem 'rails', '3.2.11'
gem 'pg'
# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails'

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
end

gem 'haml'
gem 'devise'
gem 'cancan'
gem 'activeadmin', git: 'https://github.com/gregbell/active_admin.git'
gem 'state_machine'
gem 'paperclip'
gem 'hoptoad_notifier'
gem 'acts_as_tree'
gem 'redcarpet'
gem 'aws-sdk'
gem 'bourbon'
gem 'css3buttons'
gem 'simple_form'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'ranked-model'
gem 'country-select'
gem 'launchy'
gem 'heroku'
gem 'taps'
gem 'truncate_html'

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'shoulda-context', require: false
  gem 'capybara'
  gem 'database_cleaner'
end

group :development do
  gem 'sqlite3' # for heroku db:pull via taps gem
end
