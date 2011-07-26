Feature: Business Registration
  In order to promote my business
  As a business user
  I want to be able to register the business

  Background:
    Given there is a record for user with email "abc@example.com" and password "password"
    And I am logged in with email "abc@example.com" and password "password"

  Scenario: Business registration - first step
    Given I am on the business registration page as user "abc@example.com"
    When I fill in "Name Of Business" with "My Business"
    And I fill in the following:
    | Address                                     | Street No. 10   |
    | City                                        | Los Angeles     |
    | State                                       | CA              |
    | Zip                                         | 90001           |
    | Contact Name                                | My Self         |
    | Contact Phone                               | 734876856       |
    | Contact Email                               | abc@example.com |
    | Contact Email Confirmation                  | abc@example.com |
    | business_billing_address_attributes_address | Street No. 10   |
    | business_billing_address_attributes_city    | Los Angeles     |
    | business_billing_address_attributes_state   | CA              |
    | business_billing_address_attributes_zip     | 90001           |
    And I press "Submit"
    Then the business with name "My Business", address "Street No. 10", city "Los Angeles", state "CA", zip "90001", contact name "My Self", contact phone "734876856" and contact email "abc@example.com" must be created for user "abc@example.com"
    And I should be on the business registration step 2 page as user "abc@example.com" and business as "My Business" 

  Scenario: Business registration - second step
    Given there is a business for user "abc@example.com" with name "My Business"
    And I am on the business registration step 2 page as user "abc@example.com" and business as "My Business"
    When I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_1.gif" to "Business Card"
    And I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_2.png" to "Business Logo"
    And I check "I don't have a web banner, please use my business card"
    And I fill in "Additional Notes" with "some text..."
    And I press "Submit"
    Then I should be on the business registration step 3 page as user "abc@example.com" and business as "My Business"
    
  Scenario: Business registration - third step
    Given there is a business for user "abc@example.com" with name "My Business"
    And I am on the business registration step 3 page as user "abc@example.com" and business as "My Business"
    When I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_1.gif" to "MP3 File"
    And I attach the file at "test/fixtures/files_to_upload/test_file_to_upload_2.png" to "Text file"
    And I fill in "business_promotional_media_text" with "media text goes here..."
    And I fill in "Additional Notes" with "some text..."
    And I press "Submit"
    Then I should be on the account confirmation page
    And I press "Confirm"
    Then I should be on logged in page

  Scenario: Download attached file in second step
    Given there is a business for user "abc@example.com" with name "My Business"
    And I am on the business registration step 2 page as user "abc@example.com" and business as "My Business"
    And I upload the business card and business logo and web banner
    When I follow "test_file_to_upload_1.gif"
    Then the file "test_file_to_upload_1.gif" should download
    
    
