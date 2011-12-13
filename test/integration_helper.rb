require 'test_helper'
require 'capybara/rails'
require 'support/steps'

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  Capybara.current_driver = :selenium
  self.use_transactional_fixtures = false
end
