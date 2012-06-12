require 'requests_helper'

class UserTest < ActionDispatch::IntegrationTest

  setup do
    @adg_question1 = AdgQuestion.create!(question: 'Do you Believe In GOD?', show_radio: true)
    @adg_question2 = AdgQuestion.create!(question: 'Do you believe that there is something that survives after physical death?', show_radio: true )
    @adg_question3 = AdgQuestion.create!(question: 'What specific topics are you interested in discussing?', show_radio: true )
    @adg_question4 = AdgQuestion.create!(question: 'What books have you read in this topic', show_radio: true )
    @user = FactoryGirl.create(:user)
  end

  teardown do
    DatabaseCleaner.clean
  end

  test 'Answer ADG questions' do
    sign_in(@user)
    click_link 'Afterlife Discussion Groups'
    click_link 'Register'
    within('table.adg_questions tr:nth-child(1)') do
      choose 'Yes'
      fill_in "adg_registration[answer[#{@adg_question1.id}]]", with: 'some text here...'
    end

    within('table.adg_questions tr:nth-child(2)') do
      choose 'No'
    end

    within('table.adg_questions tr:nth-child(3)') do
      choose 'Yes'
      fill_in "adg_registration[answer[#{@adg_question3.id}]]", with: 'some text for topics here...'
    end

    within('table.adg_questions tr:nth-child(4)') do
      choose 'Yes'
      fill_in "adg_registration[answer[#{@adg_question4.id}]]", with: 'some text for books read here...'
    end

    click_on 'Submit'
    assert_match "/users/#{@user.id}", current_url
  end

  test "User is redirected to registration if not logged-in" do
    visit('/')
    click_link 'Afterlife Discussion Groups'
    click_link 'Register'
    assert_match '/users/sign_up', current_url
    fill_in_reg(email: 'test2@example.com')
    click_on 'Confirm'
    assert page.has_content?("Welcome")
    click_on 'Home'
    assert_match '/adg_registration/new', current_url
  end
end
