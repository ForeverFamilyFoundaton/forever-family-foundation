Given /^I am logged in with email "([^\"]*)" and password "([^\"]*)"$/ do |email, password|
  visit new_user_session_path
  fill_in(:email, :with => email)
  fill_in(:password, :with => password)
  click_button('Sign in')
end

Given /^I am not logged in$/ do
  visit logout_path
end

Given /^I am logged in$/ do
  @user = FactoryGirl.create(:user)
  log_me_in(@user)
end

Given /^I am logged in with an email of "([^\"]*)"$/ do |email|
  @user = FactoryGirl.create(:user, :email => email, :email_confirmation => email)
  log_me_in(@user)
end

Given /^I am an admin user$/ do
  @user.roles << Role.find_by_name('admin')
end

def log_me_in(user)
  visit("/users/login")
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password')
  click_button('Sign in')
end
