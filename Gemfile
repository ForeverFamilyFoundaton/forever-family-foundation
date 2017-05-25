source 'http://rubygems.org'

ruby '2.3.3'

gem 'protected_attributes'

gem 'rails', '~> 4.2.5'
gem 'pg', '~> 0.18.4'
gem 'puma'
# Gems used only for assets and not required
# in production environments by default.
gem 'activeadmin', '~> 1.0.0.pre2'
#gem 'activeadmin', github: 'activeadmin/activeadmin'
#gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'acts_as_tree', '~> 2.4.0'
gem 'aws-sdk', '~>2.3' # '<= 2.0'
gem 'bourbon', '~> 4.2.6'
gem 'cancan', '~> 1.6.10'
gem 'chronic', '~> 0.10.2'
gem 'coffee-rails', '4.1.1'
gem "comma", "~> 3.2.1"
gem 'compass-blueprint', '~> 1.0'
gem 'compass-rails', '~> 2.0.5'
gem 'country_select', '~>2.5.0'
gem 'css3buttons', '~> 1.0.1'
gem 'delayed_job_active_record'
gem 'devise', '~> 3.5.4'
gem 'figaro'
gem 'fog', '1.37.0'
gem 'haml', '~> 4.0.5'
gem 'honeybadger', '~> 2.0.12'
gem 'jquery-rails', '~> 4.1.0'
gem 'jquery-ui-rails', '~> 5.0'
gem 'kaminari', '~> 0.16.1'
gem 'launchy', '~> 2.1'
gem 'net-ssh', '~> 3.0.1'
gem 'newrelic_rpm', '~> 3.13'
gem 'non-stupid-digest-assets'
gem 'paperclip', '5.1.0' # '4.3.6' # '4.3.2' use with 'aws-sdk', '< 2.0'
gem 'ranked-model', '~> 0.4.0'
gem 'ransack'
#gem 'recaptcha', '2.0.0'  #'1.0.2', require: "recaptcha/rails"
gem "recaptcha", require: "recaptcha/rails"
gem 'redcarpet', '~> 3.3.4'
gem "sass-rails", "~> 5.0.4"
gem 'simple_form', '~> 3.0'
gem 'state_machine'
gem 'stripe', '~> 1.33.0'
gem 'taps', '~> 0.3.24'
gem 'truncate_html', '~> 0.9.2'
gem 'uglifier', '~> 2.7.2'
gem 'seed_dump'

group :test do
  gem 'byebug', platform: :mri
  gem 'capybara',  '2.14.0'  #'2.6.0'
  gem 'capybara-screenshot', '1.0.11'
  gem 'database_cleaner', '1.6.0' #'~> 1.5.1', require: false
  gem 'email_spec', '~> 2.0.0'
  gem 'factory_girl_rails', '4.4.1'
  gem 'faker', '~> 1.6.1'
  gem 'poltergeist', '~> 1.8.1'
  gem 'rspec_junit_formatter', '0.2.3'
  gem 'rspec-rails', '~> 3.4.0'
  gem 'selenium-webdriver', '~> 2.48'
  gem 'shoulda-matchers', '2.8.0'
  gem 'timecop', '~> 0.8.0'
  gem 'webmock', '~> 1.22'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'spring'
end

group :development, :test do

  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-stack_explorer'
end

group :production do
  gem 'rails_12factor'
end
