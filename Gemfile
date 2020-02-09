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
# Gems used only for assets and not required
# in production environments by default.
gem 'activeadmin'
gem 'acts_as_tree', '~> 2.4.0'
gem 'aws-sdk-s3'
gem 'bootsnap'
gem 'bourbon'
gem 'cancan'
gem 'chronic'
gem 'coffee-rails'
gem "comma"
gem 'compass-blueprint'
gem 'compass-rails'
gem 'country_select'
gem 'css3buttons'
gem 'devise'
gem 'discard'
gem 'figaro'
gem 'fog', '1.37.0'
gem 'haml'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'net-ssh'
gem 'newrelic_rpm'
gem 'non-stupid-digest-assets'
gem 'paperclip'
gem 'ranked-model'
gem 'ransack'
gem 'recaptcha'
gem 'redcarpet'
gem 'rollbar'
gem 'sass-rails', '5.0.7'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sidekiq-failures'
gem 'simple_form'
gem 'state_machine'
gem 'stripe'
gem 'truncate_html', '~> 0.9.2'
gem 'uglifier'
gem 'seed_dump'

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
  gem 'guard'
  gem 'guard-rspec'
  gem 'spring'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug'
end

group :production do
  gem 'rails_12factor'
end
