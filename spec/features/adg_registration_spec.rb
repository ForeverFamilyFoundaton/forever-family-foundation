RSpec.feature 'ADG registration' do

  before do
    @adg_question1 = AdgQuestion.create!(question: 'Do you Believe In GOD?', show_radio: true)
    @adg_question2 = AdgQuestion.create!(question: 'Do you believe that there is something that survives after physical death?', show_radio: true )
    @adg_question3 = AdgQuestion.create!(question: 'What specific topics are you interested in discussing?', show_radio: true )
    @adg_question4 = AdgQuestion.create!(question: 'What books have you read in this topic', show_radio: true )
    @user = FactoryBot.create(:user)
  end

  it 'Answer ADG questions', js: true do
    pending "agd_registration table can not be found, has been working suddenly stopped, no change to source"
    sign_in(@user)
    within '#site_nav' do
      click_link 'Afterlife Discussion Groups'
    end
    click_link 'Register'
    within('table.adg_questions tr:nth-child(1)') do
      fill_in "adg_registration[answer[#{@adg_question1.id}]]", with: 'some text here...'
    end

    within('table.adg_questions tr:nth-child(2)') do
    end

    within('table.adg_questions tr:nth-child(3)') do
      fill_in "adg_registration[answer[#{@adg_question3.id}]]", with: 'some text for topics here...'
    end

    within('table.adg_questions tr:nth-child(4)') do
      fill_in "adg_registration[answer[#{@adg_question4.id}]]", with: 'some text for books read here...'
    end

    click_on 'Submit'
    expect(current_url).to match "/users/#{@user.id}"
  end

  it "User is redirected to registration if not logged-in" do
    pending 'remove redirects'
    visit('/')
    within '#site_nav' do
      click_link 'Afterlife Discussion Groups'
    end
    click_link 'Register'
    expect(page).to have_content 'Login Info'
    fill_in_reg(email: 'test2@example.com')
    click_on 'Confirm'
    expect(page).to have_content("Welcome")
    click_on 'Home'
    expect(page).to have_content("Adg Registrations: New")
  end
end
