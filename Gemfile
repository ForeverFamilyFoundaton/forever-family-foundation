source 'http://rubygems.org'

ruby '2.1.2'

gem 'protected_attributes'

gem 'rails', '~> 4.1.4'
gem 'pg', '~> 0.17.1'
gem 'unicorn'
# Gems used only for assets and not required
# in production environments by default.
gem 'jquery-rails', '~> 3.1.1'
gem 'jquery-ui-rails', '4.2.1'
gem "sass-rails", "~> 4.0.2"
gem 'coffee-rails', '4.0.1'
gem 'uglifier', '~> 2.5.0'
gem 'compass-rails', '~> 1.1.7'
gem 'haml', '~> 4.0.5'
gem 'devise', '~> 3.2.4'
gem 'cancan', '~> 1.6.10'
gem 'activeadmin', git: 'https://github.com/gregbell/active_admin', ref: '4f445b51c22b12af2cdde57fe2ce9835c32ef88e'
gem 'state_machine'
gem 'paperclip', '4.2.0'
gem 'fog', '1.23.0'
gem 'acts_as_tree', '~> 1.6.1'
gem 'redcarpet', '~> 3.1.2'
gem 'aws-sdk', '~> 1.42.0'
gem 'bourbon', '~> 3.2.3'
gem 'css3buttons', '~> 1.0.1'
gem 'simple_form', '3.0.2'
gem 'stripe', '~> 1.13.0'
gem 'ranked-model', '~> 0.4.0'
gem 'country_select', github: 'stefanpenner/country_select'
gem 'launchy', '~> 2.1'
gem 'taps', '~> 0.3.24'
gem 'truncate_html', '~> 0.9.2'
gem 'kaminari', '~> 0.16.1'
gem 'chronic', '~> 0.10.2'
gem 'honeybadger', '~> 1.15.3'
gem 'newrelic_rpm', '~> 3.8.0.218'
gem 'non-stupid-digest-assets'

group :test do
  gem 'poltergeist', '~> 1.5.0'
  gem 'rspec-rails', '~> 3.0.1'
  gem 'faker', '~> 1.4.1'
  gem 'selenium-webdriver', '2.41.0'
  gem 'factory_girl_rails', '4.4.1'
  gem 'shoulda-matchers', '2.6.1'
  gem 'capybara', '2.2.1'
  gem 'database_cleaner', '~> 1.3.0', require: false
  gem 'email_spec', '~> 1.6.0'
  gem 'webmock', '~> 1.18.0'
  gem 'timecop', '~> 0.7.1'
end

group :development do
  gem 'spring'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'
end

gem 'rails_12factor', group: :production
