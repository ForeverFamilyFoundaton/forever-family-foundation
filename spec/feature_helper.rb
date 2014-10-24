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

