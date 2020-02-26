# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'webmock'
require "paperclip/matchers"
require 'support/fixtures'
require 'support/js_drivers'
require 'support/faker'
require 'support/devise'
require 'support/capybara-host'
require 'support/sidekiq'
require 'support/factory_bot'
require 'support/helpers'
require 'support/shoulda_matchers'
require 'support/webmock'

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end
