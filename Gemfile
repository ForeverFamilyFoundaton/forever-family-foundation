source 'http://rubygems.org'

ruby '2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '5.2.4.1'

gem 'protected_attributes_continued'
gem 'rails-controller-testing'

gem 'pg'
gem 'puma'
gem 'turbolinks'
gem 'activeadmin'
gem 'acts_as_tree'
gem 'aws-sdk-s3'
gem 'bootsnap'
gem 'bootstrap'
gem 'cancancan'
gem 'chronic'
gem 'coffee-rails'
gem "comma"
gem 'country_select'
gem 'devise'
gem 'discard'
gem 'figaro'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'net-ssh'
gem 'newrelic_rpm'
gem 'paperclip'
gem 'ranked-model'
gem 'ransack'
gem 'recaptcha'
gem 'redcarpet'
gem 'rollbar'
gem 'sass-rails'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'simple_form'
gem 'state_machine'
gem 'stripe'

group :test do
  gem 'capybara'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter', '0.2.3'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'vcr'
  gem 'webdrivers'
  gem 'webmock'
end

group :development do
  gem 'pry'
  gem 'guard'
  gem 'guard-rspec'
  gem 'spring'
  gem 'rails_layout'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug'
end
