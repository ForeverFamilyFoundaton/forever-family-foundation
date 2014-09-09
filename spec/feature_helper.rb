require 'rails_helper'
require 'database_cleaner'
require 'capybara/poltergeist'

require 'webmock/rspec'

include ActionDispatch::TestProcess

Timecop.travel Time.local(2014, 1, 1, 12, 0, 0)

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    Capybara.javascript_driver = :poltergeist
  end

  config.before :each do |example|
    WebMock.allow_net_connect!
    if example.metadata[:js] || example.metadata[:driver] == :selenium
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
