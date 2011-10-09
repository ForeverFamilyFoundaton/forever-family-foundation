require 'integration_helper'

class UserTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = :selenium
    @user = FactoryGirl.create(:user, { email: 'abc@example.com'})
  end
  
  teardown do
    DatabaseCleaner.clean
  end

  test 'Business registration - Step 1' do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in "Name Of Business", with: "My Business"
    fill_in "Address", with: "Street No. 10"
    fill_in "City", with: "Los Angeles"
    fill_in "State", with: "CA"
    fill_in "Zip", with: "90001"
    fill_in "Contact Name", with: "My Self"
    fill_in "Contact Phone", with: "734876856"
    fill_in "Contact Email", with: "abc@example.com"
    fill_in "Contact Email Confirmation", with: "abc@example.com"
    fill_in "business_billing_address_attributes_address", with: "Street No. 10"
    fill_in "business_billing_address_attributes_city", with: "Los Angeles"
    fill_in "business_billing_address_attributes_state", with: "CA"
    fill_in "business_billing_address_attributes_zip", with: "90001"
    click_on "Submit"
    assert_match "users/#{@user.id}/businesses/1/edit?step=2", current_url
    assert_match 'My Business', @user.reload.business.name
  end

  # test 'Business registration - Step 2' do

  # # Scenario: Business registration - second step
  # #   Given there is a business for user "abc@example.com" with name "My Business"
  # #   And I am on the business registration step 2 page as user "abc@example.com" and business as "My Business"
  # #   When I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_1.gif" to "Business Card"
  # #   And I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_2.png" to "Business Logo"
  # #   And I check "I don't have a web banner, please use my business card"
  # #   And I fill in "Additional Notes" with "some text..."
  # #   And I press "Submit"
  # #   Then I should be on the business registration step 3 page as user "abc@example.com" and business as "My Business"
  #   end

  #   test 'Business registration - Step 3' do
  # # Scenario: Business registration - third step
  # #   Given there is a business for user "abc@example.com" with name "My Business"
  # #   And I am on the business registration step 3 page as user "abc@example.com" and business as "My Business"
  # #   When I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_1.gif" to "MP3 File"
  # #   And I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_2.png" to "Text file"
  # #   And I fill in "business_promotional_media_text" with "media text goes here..."
  # #   And I fill in "Additional Notes" with "some text..."
  # #   And I press "Submit"
  # #   Then I should be on the account confirmation page
  # #   And I press "Confirm"
  # #   Then I should be on logged in page
  #   end
  #   test 'Business registration - Attach File' do
  #     # Scenario: Download attached file in second step
  #     #   Given there is a business for user "abc@example.com" with name "My Business"
  #     #   And I am on the business registration step 2 page as user "abc@example.com" and business as "My Business"
  #     #   And I upload the business card and business logo and web banner
  #     #   When I follow "test_file_to_upload_1.gif"
  #     #   Then the file "test_file_to_upload_1.gif" should download
  #   end    
    
end