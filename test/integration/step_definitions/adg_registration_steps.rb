
Given /^I check "([^\"]*)" as "([^\"]*)"$/ do |question, radio_val|
  adg_question = AdgQuestion.find_by_question(question)
  choose "adg_registration_radio_val[#{adg_question.id}]_#{radio_val.downcase}"
end

Given /^I enter text for "([^\"]*)" as "([^\"]*)"$/ do |question, answer|
  adg_question = AdgQuestion.find_by_question(question)
  fill_in "adg_registration_answer_#{adg_question.id}", :with => answer
end

Then /^the text in "([^\"]*)" must be "([^\"]*)"$/ do |question, answer|
  adg_question = AdgQuestion.find_by_question(question)
  field_with_id("adg_registration_answer_#{adg_question.id}").value.should == answer
end

Then /^the radio button in "([^\"]*)" must be checked "([^\"]*)"$/ do |question, radio_val|
  adg_question = AdgQuestion.find_by_question(question)
  field_with_id("adg_registration_radio_val[#{adg_question.id}]_#{radio_val.downcase}").should be_checked
end

Then /^I will register successfully as non business user$/ do
  Given %{I am on the user registration page}
  When %{I fill in "Email" with "abc@example.com"}
  And %{I fill in "Email confirmation" with "abc@example.com"}
  And %{I fill in "Password" with "password"}
  And %{I fill in "Password confirmation" with "password"}
  And %{I fill in "First name" with "Fname"}
  And %{I fill in "Last name" with "Lname"}
  And %{I fill in "Address" with "Street no. 100"}
  And %{I fill in "City" with "Los Angeles"}
  And %{I fill in "State" with "CA"}
  And %{I fill in "Zip" with "90001"}
  And %{I check "Yes, I accept the Terms of Use"}
  And %{I press "Register"}
end

Then /^I should be redirected back to ADG registration$/ do
  visit new_adg_registration_path
end

