require 'test_helper'
require 'capybara/rails'
require 'support/steps'

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  self.use_transactional_fixtures = false
end
