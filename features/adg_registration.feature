@javascript
Feature: ADG Registration
  In order to discuss in ADG
  As an user
  I want to be able to register with the ADG

  Background:
    Given I am logged in
    And there are the following ADG questions
      | question | show_radio |
      | Do you Believe In GOD? | true |
      | Do you believe that there is something that survives after physical death? | true |
      | What specific topics are you interested in discussing? | false |
      | What books have you read in this topic | false |
    
  Scenario: User is logged in and enters ADG answers
    And I follow "Afterlife Discussion Group Enrollment"
    And I check "Do you Believe In GOD?" as "Yes"
    And I enter text for "Do you Believe In GOD?" as "some text here..."
    And I check "Do you believe that there is something that survives after physical death?" as "No"
    And I enter text for "What specific topics are you interested in discussing?" as "some text for topics here..."
    And I enter text for "What books have you read in this topic" as "some text for books read here..."
    And I press "Submit"
    Then I should be on the ADG registration page
    Then the radio button in "Do you Believe In GOD?" must be checked "Yes"
    Then the text in "Do you Believe In GOD?" must be "some text here..."
    Then the radio button in "Do you believe that there is something that survives after physical death?" must be checked "No"
    Then the text in "What specific topics are you interested in discussing?" must be "some text for topics here..."
    Then the text in "What books have you read in this topic" must be "some text for books read here..."

  Scenario: User is not logged-in
    Given I am not logged in
    When I am on the ADG registration page
    Then I should be on the user registration page
    And I will register successfully as non business user
    Then I should be redirected back to ADG registration


