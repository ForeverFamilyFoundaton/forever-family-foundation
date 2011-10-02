require 'integration_helper'

class UserTest < ActionDispatch::IntegrationTest

  setup do
    DatabaseCleaner.start
    [{ question: 'Do you Believe In GOD?', show_radio: true },
     { question: 'Do you believe that there is something that survives after physical death?', show_radio: true },
     { question: 'What specific topics are you interested in discussing?', show_radio: true },
     { question: 'What books have you read in this topic', show_radio: true }].each do |adg_question_params| 
      AdgQuestion.create!(adg_question_params)
    end

    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  teardown do
    DatabaseCleaner.clean
  end
  
    
  test 'Answer ADG questions' do
    click_link "After life discussion group"
    # And I check "Do you Believe In GOD?" as "Yes"
    # And I enter text for "Do you Believe In GOD?" as "some text here..."
    # And I check "Do you believe that there is something that survives after physical death?" as "No"
    # And I enter text for "What specific topics are you interested in discussing?" as "some text for topics here..."
    # And I enter text for "What books have you read in this topic" as "some text for books read here..."
    # And I press "Submit"
    # Then I should be on the ADG registration page
    # Then the radio button in "Do you Believe In GOD?" must be checked "Yes"
    # Then the text in "Do you Believe In GOD?" must be "some text here..."
    # Then the radio button in "Do you believe that there is something that survives after physical death?" must be checked "No"
    # Then the text in "What specific topics are you interested in discussing?" must be "some text for topics here..."
    # Then the text in "What books have you read in this topic" must be "some text for books read here..."


  end


    # Scenario: User is not logged-in
  #   Given I am not logged in
  #   When I am on the ADG registration page
  #   Then I should be on the user registration page
  #   And I will register successfully as non business user
  #   Then I should be redirected back to ADG registration
end