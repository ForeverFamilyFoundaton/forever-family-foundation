source 'http://rubygems.org'

gem 'rails', '3.1.1.rc1'
gem 'pg'
gem 'rake', '0.9.3.beta1'
# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', "~> 3.1.0"

group :assets do
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'compass', git: 'https://github.com/chriseppstein/compass.git'
end

gem 'haml'
gem 'devise' 
gem "cancan"
gem 'activeadmin'
gem "meta_search", '>= 1.1.0.pre'
gem "transitions", :require => ["transitions", "active_record/transitions"]
gem "paperclip", "~> 2.4"
gem "hoptoad_notifier"
gem 'acts_as_tree'
gem 'acts_as_list'
gem 'redcarpet'
gem 'aws-s3'
gem 'css3buttons'

group :test do
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "shoulda-context"
  gem 'capybara'
  gem 'database_cleaner'
end

group :development do
  gem "thin"
end