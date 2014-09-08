require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'support/steps'

# Capybara.default_driver = :selenium

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
