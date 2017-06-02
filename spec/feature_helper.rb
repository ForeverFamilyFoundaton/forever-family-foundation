require 'rails_helper'
require 'database_cleaner'
require 'capybara/poltergeist'
require 'capybara/rspec'
Capybara.javascript_driver = :webkit

include ActionDispatch::TestProcess

Timecop.travel Time.local(2014, 1, 1, 12, 0, 0)

Capybara.javascript_driver = :poltergeist

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.before do |example|
    case
    when example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
      Capybara.current_driver = Capybara.javascript_driver
    when example.metadata[:selenium]
      DatabaseCleaner.strategy = :truncation
      Capybara.current_driver = :selenium
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after(:each) do |example|
    DatabaseCleaner.clean
    Capybara.use_default_driver
  end

  config.append_after(:each) do
    Capybara.reset_sessions!
  end
end

def pause
  puts 'pausing...'
  STDIN.gets
end

def create_admin(options={})
  @admin ||= begin
    admin = AdminUser.create!(
      :email => options[:email] || 'admin@test.com',
      :password => '123456', :password_confirmation => '123456',
      :active => options[:active]
    )
    admin
  end
end

def sign_in_as_admin(options={}, &block)
  admin = create_admin(options)
  visit '/admin'
  fill_in 'admin_user_email', with: 'admin@test.com'
  fill_in 'admin_user_password', with: '123456'
  yield if block_given?
  click_on 'Login'
  admin
end

def page_address
  URI(current_url)
end

