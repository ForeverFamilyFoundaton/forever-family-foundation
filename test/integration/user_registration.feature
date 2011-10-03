Feature: User Registration
  In order to use the application
  As an user
  I want to be able to register with the application

  Scenario: Successful registration for a non-business user
    Given I am on the user registration page
    When I fill in "Email" with "abc@example.com"
    And I fill in "Email confirmation" with "abc@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I fill in "First name" with "Fname"
    And I fill in "Last name" with "Lname"
    And I fill in "Address" with "Street no. 100"
    And I fill in "City" with "Los Angeles"
    And I fill in "State" with "CA"
    And I fill in "Zip" with "90001"
    And I check "Yes, I accept the Terms of Use"
    And I press "Register"
    Then I should be on the account confirmation page
    And I press "Confirm"
    Then I should be on logged in page

  Scenario: Successful registration for a business user
    Given I am on the user registration page
    When I fill in "Email" with "abc@example.com"
    And I fill in "Email confirmation" with "abc@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I fill in "First name" with "Fname"
    And I fill in "Last name" with "Lname"
    And I fill in "Address" with "Street no. 100"
    And I fill in "City" with "Los Angeles"
    And I fill in "State" with "CA"
    And I fill in "Zip" with "90001"
    And I check "Yes, I accept the Terms of Use"
    And I check "I am registering a business"
    And I press "Register"
    Then I should be on the business registration page as user "abc@example.com"


  Scenario Outline: Unsuccessful registration if mandatory fields are not entered
    Given I am on the user registration page
    When I fill in "Email" with "<email>"
    And  I fill in "Email confirmation" with "<email_confirm>"
    And I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<p_confirmation>"
    And I fill in "First name" with "<f_name>"
    And I fill in "Last name" with "<l_name>"
    And I fill in "Address" with "<address>"
    And I fill in "City" with "<city>"
    And I fill in "State" with "<state>"
    And I fill in "Zip" with "<zip>"
    And I check "Yes, I accept the Terms of Use"
    And I press "Register"
    Then I should see "prohibited this user from being saved"
    Then I should be on failed registration page

    Examples:
      | email           | password | p_confir | f_name | l_name| address | city | state | zip | email_confirm|
      |                 | secret   | secret   | fname  | lname | Street no. 100 | Los Angeles | CA | 90001 | abc@example.com |
      | abc@example.com | secret   | mismatch | fname  | lname | Street no. 100 | Los Angeles | CA | 90001 | abc@example.com |
      | abc@example.com | secret   | secret   | fname  |       | Street no. 100 | Los Angeles | CA | 90001 | abc@example.com |
      | abc@example.com | secret   | secret   |        | lname | Street no. 100 | Los Angeles | CA | 90001 | abc@example.com |
      | abc@example.com | secret   | secret   | fname  | lname |  | Los Angeles | CA | 90001 | abc@example.com |
      | abc@example.com | secret   | secret   | fname  | lname | Street no. 100 |  | CA | 90001 | abc@example.com |
      | abc@example.com | secret   | secret   | fname  | lname | Street no. 100 | Los Angeles |  | 90001 | abc@example.com |
      | abc@example.com | secret   | secret   | fname  | lname | Street no. 100 | Los Angeles | CA |  | abc@example.com |
      | abc@example.com | secret   | secret   | fname  | lname | Street no. 100 | Los Angeles | CA | 90001 | mismatch@example.com |

  Scenario: Unsuccessful registration if Terms of Service is not accepted
    Given I am on the user registration page
    When I fill in "Email" with "abc@example.com"
    And  I fill in "Email confirmation" with "<email_confirm>"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I fill in "First name" with "Fname"
    And I fill in "Last name" with "Lname"
    And I fill in "Address" with "Street no. 100"
    And I fill in "City" with "Los Angeles"
    And I fill in "State" with "CA"
    And I fill in "Zip" with "90001"
    And I press "Register"
    Then I should see "Terms of use must be accepted"
    Then I should be on failed registration page
    
