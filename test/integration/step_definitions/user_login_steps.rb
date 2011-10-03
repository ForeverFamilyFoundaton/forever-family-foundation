Given /^there is a record for user with email "([^\"]*)" and password "([^\"]*)"$/ do |email, password|
  FactoryGirl.create(:user,:email => email, :email_confirmation => email, :password => password, :password_confirmation => password)
end

Given /^there is a record for admin with email "([^\"]*)" and password "([^\"]*)"$/ do |email, password|
  FactoryGirl.create(:admin)
end
