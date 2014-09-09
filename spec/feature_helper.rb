require 'rails_helper'

require 'webmock/rspec'
WebMock.allow_net_connect!


include ActionDispatch::TestProcess

  Timecop.travel Time.local(2014, 1, 1, 12, 0, 0)

  config.use_transactional_fixtures = false

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    Capybara.javascript_driver = :poltergeist
  end

  config.before :each do
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
