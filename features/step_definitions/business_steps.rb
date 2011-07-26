Given /^there is a business for user "([^\"]*)" with name "([^\"]*)"$/ do |user_email, business_name|
  user = User.find_by_email(user_email)
  business = FactoryGirl.create(:business,:name => business_name, :contact_email => user_email, :contact_email_confirmation => user_email, :user => user)
end

When /^I upload the business card and business logo and web banner$/ do
  attach_file "Business Card", "test/fixtures/files_to_upload/test_file_to_upload_1.gif"
  attach_file "Business Logo", "test/fixtures/files_to_upload/test_file_to_upload_2.png"
  attach_file "Web Banner", "test/fixtures/files_to_upload/test_file_to_upload_2.png"
  click_button("Submit")
  click_link("Step 2")
end

Then /^the business with name "([^\"]*)", address "([^\"]*)", city "([^\"]*)", state "([^\"]*)", zip "([^\"]*)", contact name "([^\"]*)", contact phone "([^\"]*)" and contact email "([^\"]*)" must be created for user "([^\"]*)"$/ do |name, address, city, state, zip, contact_name, contact_phone, contact_email, user_email|
  user = User.find_by_email(user_email)
  business = user.business
  billing_address = business.billing_address
  business.name = name
  business.address.address = address
  business.address.city = city
  business.address.state = state
  business.address.zip = zip
  business.contact_name = contact_name
  business.contact_phone = contact_phone
  business.contact_email = contact_email
  
  billing_address.address = address
  billing_address.city = city
  billing_address.state = state
  billing_address.zip = zip
end

Then /^the file "([^\"]*)" should download$/ do |file_name|
  response.header["Content-Disposition"].should == "attachment; filename=\"#{file_name}\""
end
